import json
import jsonschema

def validate_json_schema(input_json, reference_schema_path):
    try:
        reference_schema = __get_reference_json(reference_schema_path)
        jsonschema.validate(instance=input_json, schema=reference_schema)
        print("JSON geçerli.")
    except jsonschema.SchemaError as schema_err:
        print(f'JSON şema hatası: {schema_err}')
    except jsonschema.ValidationError as val_err:
        print(f'JSON doğrulama hatası: {val_err}')
    except json.decoder.JSONDecodeError as json_err:
        print(f'JSON dönüşüm hatası: {json_err}')
    except FileNotFoundError as file_err:
        print(f'Dosya bulunamadı: {file_err}')
    except Exception as ex:
        print(f'Beklenmeyen bir hata oluştu: {ex}')

def __get_reference_json(reference_schema_path):
    try:
        with open(reference_schema_path) as json_file:
            data = json.load(json_file)
        return data
    except (json.decoder.JSONDecodeError, FileNotFoundError) as err:
        raise err
    except Exception as ex:
        raise Exception(f'Beklenmeyen bir hata oluştu: {ex}')

# Örnek JSON verisi
input_json = {
    "active": True,
    "city": "Testcity",
    "contracts": [
        {"currency": "USD", "id": 33, "price": 9.99, "type": "basic"},
        {"currency": "USD", "id": 106, "price": 39.99, "type": "premium-b"}
    ],
    "email": "tom@miller.com",
    "id": 1,
    "name": "miller",
    "street": "1st street",
    "surname": "tom",
    "zip": "99122"
}

# Örnek JSON şema dosyası yolu
reference_schema_path = "path/to/schema.json"

# JSON doğrulama işlemi
validate_json_schema(input_json, reference_schema_path)
