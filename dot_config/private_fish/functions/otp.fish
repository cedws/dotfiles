function otp --description "Generate OTP code using YubiKey"
    ykman oath accounts code -s $argv | pbcopy
    echo "OTP code copied to clipboard"
end

