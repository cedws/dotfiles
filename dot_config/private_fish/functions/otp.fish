function otp --description "Generate OTP code using YubiKey"
    ykman oath accounts code -s $argv | pbcopy; and echo "OTP code copied to clipboard"
end
