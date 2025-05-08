# 📅 AgendaPro

**AgendaPro** é um sistema simples de agendamento de compromissos utilizando SQLite (DATE, TIME, DATETIME, CURRENT_TIMESTAMP). Ele permite armazenar, consultar, atualizar e excluir compromissos com suporte completo a operações baseadas em **data** e **hora**.

## 🔧 Funcionalidades Principais

- Cadastro de compromissos com título, descrição, data e hora.
- Listagens dinâmicas baseadas na data atual.
- Filtros por hora do dia, finais de semana e compromissos futuros/prévios.
- Inserção automática da data e hora de criação do registro.
- Cálculo de quantos dias faltam até um compromisso.
- Atualizações condicionais com base na data.
- Eliminação de registros antigos.

## 🕒 Uso de Comandos de Data e Hora

### `DATE`
Utilizado para:
- Filtrar compromissos passados, futuros ou do dia atual.
- Comparações como "próximos 3 dias", "mais de 7 dias atrás", etc.

### `TIME`
Utilizado para:
- Filtrar compromissos por hora (por exemplo, compromissos antes do meio-dia).
- Comparar o horário atual com o horário de início de um compromisso.

### `DATETIME`
Usado para:
- Armazenar a data e hora completas de criação de um compromisso.
- Verificar se um compromisso foi criado nas últimas 24 horas.

### `CURRENT_TIMESTAMP`
Utilizado como valor padrão para o campo `criado_em`, garantindo que a data/hora de criação seja preenchida automaticamente.  
Também é usado para obter o horário exato do sistema no momento da execução.
