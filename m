Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795856487;
	b=yNPIYnWvtAkjR/h3LC+A742cn57RsEX9YbfUleNiz5MyYzK+UeeU14J/whhGND7Xref9
	 OI3IqhgQvoK7l54WkfjR3SOiZEFZVdLQnxa1w95jf4RPuYMwLxfUIUOMZSGuMXJ9J/lMK
	 wYTBxvWjlgUoBK033i9YfzvYEkjci26kxh88F2aMYDuJxn+pSpnNT9zflp8Q//h6wribI
	 c+6EM7eqe8D8aElD4LxnYpj+ZFQAvLMzKltu8ncAURif6N+a9WzI8ajQQnRoLror1qfiq
	 SErWKsTZTxKId+USrZv3Y3gtJR+BPonAjMSbvsIG4yG/h5aI/zKGpw8JkoDDPfFrvmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HcMpuSj3oXcRHJx9YaH6Yolmn9BCDVLY7M9wbuven4A=;
	b=JXp3FYIBgh7s7egvvyW7RqHrZx27IPyhNo0ReoQGJ7/95oIAfpD3WJFLSrRYrCICFUU7
	 SET3sHCPd16mJGEpARMARSGnfivsq7Wn+m2x6RzPauqASrCQuTfM2123/KCr0xfCUkJuf
	 Pwb6LYJXE1BXDfpCQzu2B4itugqZqifF6BUWRcw/iLerX4k7fJK8KJgIGUStcFcEbsWOR
	 xpMKpAcWliZTk9CYLJu8A6xbjBL4WQ5L0/XOIWUwnqOAsfNeXT6IcsuwPMyMpn1n/MLl8
	 cwhEjKDkqFssTJIHsgGbcHc4w7hsjhcibsnTuFL9lo6R2KzSh5uBci7x2tgft3mQDIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tF5IY/3N";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A23606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A23606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF5IY/3N
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-497614c95f0so4985498f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795856485; x=1796461285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HcMpuSj3oXcRHJx9YaH6Yolmn9BCDVLY7M9wbuven4A=;
        b=tF5IY/3NhVZLJraWtqmB3EY0/xnFkRCRPsJ9yKllFcz3wvjgNLduq5zNjnyhGwCcoQ
         feT/IzhIupjOpbic1CDesYTBZIl6DoXFPT2Mis8+X4iIJAwWNXQirrDJKP7q1akF+SUi
         Z19Ur+LZtz+EH/3CFP4jLBI2mbRhwfh4kZGHL4Dfcc903lY3qk1EX95MV9rl5nCDqCyR
         ksLJZIsf1owWEI1StTx+ylT+TY040/Tf76OIfhRYcOjZKD8OdI7QE/Re/f6tYGmoWLOf
         aNbl5KYQjANQ038Uuh9esT6WJ5raZ3DKIjhG+tyKi1NQHrltm+gvBUqg+YwgRcyWT/Sj
         4vuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795856485; x=1796461285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcMpuSj3oXcRHJx9YaH6Yolmn9BCDVLY7M9wbuven4A=;
        b=lenoyt/zMpssx4UZ7H+hj+X8Jn8ZhYtRA77cUNFFGFxfEwjhqRQ6qeQmSq06oGUdUY
         h2AsSRuqcbt+dRIVbo5IudRrsAgOTjqf7mRFtz+jv9C6Kg8lhCiZPgyAf7z0YCUhYk7e
         8NwCM2imQbUa/IEQtuQOwamicSsc9RGehKN62LEvop/qsQmUDFnZiDPFPd2RnMTGmrDG
         TGHQxrrg4Dy4cGxCv7INa1JjuimeZ4TlgY4J1LhQwK9QqiZKIj1xrk72iVc16OzJai2A
         pTOwRZx/a25WW6pOBYSJd9blUuStB20Q8g+dEAJQ5EmlxnWFXt2q4pqW7ubkyEyp+s6E
         4YdA==
X-Forwarded-Encrypted: i=1; AL+hErERgrdZjz3IlEbAgDnVh6LKc+Ao8Ns10j6LFBvZ4TpKQH8DRmNBVTrCBk5GErI3YGXPMMfcqyf9ORLT1KY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nz/ayqd3dRVkagNpftrPzMZW17IFVvjXNTylVEN9ECM0jszN/
	qAWfQijJlNYy/QbgJGyv5MjHxuPSE6a80tYyydNP+ZZJwIWr9jtmJ/qQ
X-Gm-Gg: AZFdTZd9cyfc0ythfrHzRq4rJhngP+OkSEbElKYEBDamf+SbOjXrOw6NbfaQRlM3tGY
	pc9TIZVO67k1i0PlI1Q63oVMNAhFEE+cUXhTqV2ndRWFVq3U1mj7dOz2Ycz96MB57IWuqBkcEpV
	nZfmKYTJNVG4tj79ze66TG+Ck97sCXB/Y5VnuoAb0B8vbthlnyWMUpUdf1ZUc2RNFLY56GrXPvr
	m+UB9/svDYRbfhMxicIsRpBaF60W3x5AdsRHXAzgZKTrqdyNkBZgm7ZlvaUyo75ln7EQzg4ke0K
	ZRoe9UYI0YZOhjZxUrP5+vstDd3FkKNCRUsCGGDCpD/UdD4DjYyhNg7A7yNOHtOt7hHpQJzsrZn
	CqvpB6dBolvCtkb07IdK4PaEESbSbQPJu2xaRAUd6AoXy+zCEEJQyw1gmskyxAltCMJRAyubsds
	zTmAt6dGctVBxDrwK9pySqUtlFmSjzLhESYCZj9asfcq4Vvt1wXgCEx17u/ULDNYaPYzI2TyQ6P
	pP7OW4WnTgXXMkhStARLNfyjNPSOZSyE30/SvBycn5IJ2I5XPNco5SjgTpI7HG8v4uZzDPARjv6
	rnRp/zx1gZy2ZLnNyudmOJtHy2PlQlqf1A==
X-Received: by 2002:a05:6000:3107:b0:4aa:1ae2:ff2a with SMTP id ffacd0b85a97d-4abaa977260mr63813437f8f.2.1795856484771;
        Sat, 28 Nov 2026 01:01:24 -0800 (PST)
Received: from google.com ([37.228.200.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm50089883f8f.56.2026.11.28.01.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:01:24 -0800 (PST)
Date: Sat, 28 Nov 2026 09:01:22 +0000
From: Fabio Baltieri <fabio.baltieri@gmail.com>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alwyn Kik <alwyn@kik.pw>,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2 4/7] hwmon: (nct6683) Enable fan control on ASRock
 BC-250
Message-ID: <awqYYqF0aIDLpcTg@google.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-5-jdahlin@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111082838.1418051-5-jdahlin@gmail.com>

On Wed, Nov 11, 2026 at 09:28:35AM +0100, Johan Dahlin wrote:
> The ASRock BC-250 (customer ID 0x162b) has an NCT6686D with the same fan
> control registers as the B850 Steel Legend WiFi, and manual fan control
> was reported to work there.
> 
> Enable fan control for channels 0 to 7 on this board as well.
> 
> Suggested-by: Fabio Baltieri <fabio.baltieri@gmail.com>
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
> ---
>  Documentation/hwmon/nct6683.rst | 2 +-
>  drivers/hwmon/nct6683.c         | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
> index 026515c35243..8e5cd1d7dcd2 100644
> --- a/Documentation/hwmon/nct6683.rst
> +++ b/Documentation/hwmon/nct6683.rst
> @@ -59,7 +59,7 @@ fan reported by fanN_input.
>  
>  It is also supported on the ASRock B850 Steel Legend WiFi (NCT6686D,
>  customer ID 0x164a), where pwm1 to pwm6 control the fan headers reported
> -by fan1 to fan6.
> +by fan1 to fan6, and on the ASRock BC-250 (NCT6686D, customer ID 0x162b).
>  
>  pwmN_enable selects the fan control mode:
>  
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 29fbf438c04c..f656b84ee8ac 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -1540,7 +1540,8 @@ nct6683_setup_fans(struct nct6683_data *data)
>  		}
>  	}
>  
> -	if (data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8)
> +	if (data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8 ||
> +	    data->customer_id == NCT6683_CUSTOMER_ID_AMD)
>  		data->have_fan_ctrl = data->have_pwm & GENMASK(7, 0);
>  }

Hey, just got a chance to test the v2 on my bc-250 and it works as
expected, tested it on hwmon-next since this has already been applied.

Thanks for the help!

Fabio
