#!/bin/bash
# See skript loob kataloogist test varukoopia.

echo "Alustan kataloogi 'test' varundamist..."
echo "Varundusfail salvestatakse kataloogi 'backup' nimega test.backup.tar.gz."

# Pakib test-kataloogi kokku ja salvestab selle backup-kataloogi
tar -czf ./backup/test.backup.tar.gz ./test/

echo "Varundamine on lõpetatud."
