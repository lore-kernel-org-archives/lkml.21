Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524983;
	b=5PsMUrn2Qa/pqkQTVxA0/NQZ5NoTo/kwPqEkf3GGKSOA1hO6/TRAq3J58uGZZyKRT4il
	 L31Lgx673dbAuzf+CT8yDNQ1BZou9WFAhX86vD+Nz+J4lQ3QlbxGxrg9x97ODEarAqLoY
	 xn4+IczZfQI1lzhZN5FLiC9ovCziVZWTVD4j12Gb3VIMSzd0Gh7ndahfCkKPERPw5EynT
	 csqrjC65gNseSONFjMuzhwWUP7f/4XuqEV6yejSK9xMv0Ph9I9BvCS1Hu8D3C/7JeSXqz
	 o2c/CgrHzPkdoKp3uun0/MAuoRqU2fRM+Nz2iw8iFo3In+0KTZ89gGCsqBGKKygKtsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=hN7kRr7ecbZK4AjamlewAkQtVvluvjLq4XDkOaYd8I8=;
	b=nNoP2TRgeUkBoPa62X00hZny0jDBz9eZhp8q+8D0T4ktoX7On9lvhdWjopPsb4KIvWWS
	 EXMR6bMvdmzXeeiA8TxeKE2J28J8Iu8G8hI0nCkkOXeshBGC2R0mKA3B9EjoZANEPNrnC
	 bssnMdRund0B4nL98oxBy6GAEk8Qmn2IRXtPA0PHCmDV1PK1whc0d4MT2wFEnX9eH+XuT
	 +E7bnZ4X2bWK4HaoimkY2RV28w2TiOsV3D2ODwy2SbpUOf/jpKxhWUPyMYsWixP6sN7ne
	 ITN0dOug2ZQSfoWLTlzcTinrukEQ/By4e9NoywUSOMkhAEb+BOj54NoLRAk4oBIKItg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNBdiCdz;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31240606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31240606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNBdiCdz
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38190551625so9078824eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795524982; x=1796129782; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hN7kRr7ecbZK4AjamlewAkQtVvluvjLq4XDkOaYd8I8=;
        b=fNBdiCdz+tgYtr+xzhxnPfPG9qMbfihriW14Aa7k8ZsV3gsUD2GNqwJAGrxqSDkaHv
         aMTJDtBqDRB1C+1nQOvqFLyVimivc8+G/ioVSuDJ+9dQxw84cE+h5aJZtzURCbZwv1gs
         +tBX381GTHJAXs934/XK3/nr/4/uziZxOCP72hByG/CZpYY65p6gQsNqBSL0M7K5yozD
         mRpi8Z68hSoH8YBz4FTVOHfTOQ9+oY2srKvYrtmS8a/Jlmrbr4EFsaZZifx88y2TYF3J
         ekgsZ7TNy/cUP9ICnInBTIgSaiQzViKpqGFK4ZVxBqnedpfLaQvtVF0l+4ZllOquiZpn
         pZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524982; x=1796129782;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hN7kRr7ecbZK4AjamlewAkQtVvluvjLq4XDkOaYd8I8=;
        b=nUNEA7PTpZ0/bb53MCo88hhFaj1MS5tiYGe+hgtA38eVldFr5LSyBYaBkAjOGB/Nve
         Gj+p9s41cyjHfde+COAwqtEwIFi88cwuXAkO3QtQdo0UbY4atQeZnGR0Jli57tQ/2XpN
         MTlPOjo68vzj7yxSYMkW1kogBjrpzyqhoQFRgVkfVDJSEzHpGhJ9EpeDse92qbi+K47d
         FLL4Qkh8uGBn0OQnak2egY+JuGqXXVQWYkVtLmqDKv/Oo5r6qwTp0mD/SbnBH3Uwh1HW
         TfACdZZ3KTtnzRz/DhlxlZHNg7bW1GPpDJHbjGceDAaBETxSpNCkItL5t7fRYdMFV2lm
         e9hw==
X-Forwarded-Encrypted: i=1; AL+hErHIyx9/1XFwGHjgPf1+lSarbtUWco1EXzVPLp+IoKVDRhw4plwGLyOO5eKumQFfWHPYx/eU+JBoCiMxDRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GtTc9WubPKrnfTGuh0pJxyQPtEuY56cc5jrFdXqfvmpxSQ18B
	x9dn6+2oH8ZD2MlwnM+mMSzf54aJppzUyf7BH5FFYN4JQyGrT8Qs4QRH
X-Gm-Gg: AZFdTZcxa2b/77WcGlHDjDgaqU2azNjXFXucf/jJEnveD+yrCowtX5j9UnU9oOFX/0o
	oeuCFTnh0JsbkbguZEh2bdovqAMz/CrlqE/UF+5LpVUrHcx4AWULbLuKwvqoGM0cziU4I8dC3pf
	WNlUAh/bLEZIZ+bluzzpgNXfQmoRm65La5qFHG82yXpODEe8BUyKBiMT/Rc306ix6tmrapSK5ho
	iAWIBASsqo0hpJa2T+rLAzKAXyi7nJE3YfepRlzPm4D/Dj6Cn2jwI5PXmeDaI3C+zp/FCSoUmgH
	G4hmvK9TI5yB5TsRMYvCf3nT6Z5iTx1ume0SzYJxzmZRjpO4Fe12k9ZyrLaw+ZM8kAkgl1u0MKi
	9BIUJIeY0OlWd/eN4HU7u5WF5ykmVnCmRu+0FaD/a8MRBGkQ5/xtgZQbZdIr6ww8yYHiz8qDReC
	cSfXOhKMP6TI+x/W6WGfh7uicCh2cjlqoteGU0lZN3y4dvMBfeNJDuV6x0d9uRb+XqMy0p9gFMO
	4QBG83bffJCKgpdQfXbk0qLE4Ju6qgO5IDVzJnkvsRqIF5ph6u26ndtNkspsfIy0qQEvaOkZxnY
	M6Q3BDl/0/6r61fMZn6cJIcOBXWAVnbgXqGRWg==
X-Received: by 2002:a05:693c:8042:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3856f14ca78mr16118427eec.13.1795524982187;
        Tue, 24 Nov 2026 04:56:22 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:1412:77ad:61f2:79f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm39991456eec.8.2026.11.24.04.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:56:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] i2c: scmi: fix memory leak on invalid block length
From: mdshahid03@gmail.com
To: mdshahid03@gmail.com
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261120054138.194076-1-mdshahid03@gmail.com>
References: <20261120054138.194076-1-mdshahid03@gmail.com>
Date: Tue, 24 Nov 2026 18:26:04 +0530
Message-Id: <179552496489.186639.4680455408849151360.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi,

could you please review and give your feedback ,when time permits.

Thanks
Shahid.

On 2026-11-20 11:11 +0530, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> When the returned block length is invalid,the function returns
> -EPROTO directly without freeing the ACPI response buffer.
> 
> Use goto out instead, so the allocated buffer is freed before
> returning the error.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/i2c/busses/i2c-scmi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
> index 37442c9ee222..b65771d31a28 100644
> --- a/drivers/i2c/busses/i2c-scmi.c
> +++ b/drivers/i2c/busses/i2c-scmi.c
> @@ -248,8 +248,10 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
>  			result = -EIO;
>  			goto out;
>  		}
> -		if (len == 0 || len > I2C_SMBUS_BLOCK_MAX)
> -			return -EPROTO;
> +		if (len == 0 || len > I2C_SMBUS_BLOCK_MAX) {
> +			result = -EPROTO;
> +			goto out;
> +		}
>  		data->block[0] = len;
>  		memcpy(data->block + 1, obj->buffer.pointer, len);
>  		break;
> -- 
> 2.43.0
> 
> 
> 


