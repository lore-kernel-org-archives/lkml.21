Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794964455;
	b=KWK9kynILhajKT71Yj6FfE/y2QIs1nGvPiqw2CwUH9qei+LmUseJP0Z+6eIRvgyKn8cZ
	 mEv7/V6GT5iNK+fGYnH4JNSoCsyw69FuQRQs6d8YuSX4a1ouLHmeWXc0sPSh1KG5Dug48
	 FrH0fhNsXucyrOhBy83zlRo8qTlvBUpfDdrr6fckDYENOYMcef6W3KkjCw4lySQr4k1rX
	 /65B2H7L5iSorj884DJSJ39QBxLacnDEaiIAOlzcJviJ4VDjuiT6M5jNJO7vd9A/x9Rmq
	 QYPujeU6o1xyfrp0L1eBgZlnfIpFEZ+RLYTTm7KfUdfbcO1jWL1ps43+esidEtkB6bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IRjaToXFJCE4Twj+Hd8fl9U1nDslc5RbTkQ2yvucR8E=;
	b=khbxXyBumJ7AN6pUoQV1IrUSPWPDF6wb6FX5yeEfba1tI76Q2/Ez/hw86cAP5fFqiKBX
	 QwtlbEGZFDsxD6iM0Eu8FGBgDORZMtt45GZsYQNt3tQj4DkRlkVYwPRAKWs1iaRqA18EN
	 xzH2VUdC80knoGV6+ysrMrhW1TDKBUlXq11EVOWzFE+KLGc+f/fUkomJ9f6yDgig6MYr/
	 SjJ1bURJWcqTtnguuSlaGKytcSNhoFYNacij4/ZkwMx3qS27dmrRyweJBhHg3PrgO+3rC
	 XH49EfvyrU++HrC5ShbJMJDmNhQJeBhWM5G8jQMeQmbbU9ZZCXU0qEYVElnoyFt6u/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFXYHq5V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1657606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1657606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFXYHq5V
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4c2da74c0so2759667b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794964453; cv=none;
        d=google.com; s=arc-20260327;
        b=NXDnxzhN0fyuhoLnXvbEFeSCF7jDikQgjiqRdbBt1x+5hqxCIylXr+b6CZE6UOeYMM
         uspBOfdJBbc/magMAzd+XB6AjzUGdjlZFx1gxOh40TTpTLaCXLIM8w5PGukMSnO6ZD0u
         YraKwdle4M9Fz3TrHO2GQglalSyGGkpup58iJJl3BVPWAyYYxSfULtL60M9hg1JWCvC6
         pT8b3V+GDZYC8c6ZBcl/taxr9lJuBaC7pRnCsBCu9he0TgM3R/6AVpGF8nbGt6eCdGit
         SgKY8RXKf2tJf++Y7/hChVAhKIBKXwteY5bsPNE9gFBCJcmHimyqao8n13FG3CsI9NmT
         ANbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IRjaToXFJCE4Twj+Hd8fl9U1nDslc5RbTkQ2yvucR8E=;
        fh=0menYVbEPembniNfqTVcCM7N/DOeu8WoB8RH0GgVRog=;
        b=Hw4d66vqoJuRGYMiMjH2BCo8IBYzLpLm7DoUDPLQLQjPo1WueuHEMJjzE3CNnoM5Ap
         x804qnqQ5BALlKvWcN91efHNYKwL1YlgfRXIEPv7/pNFDETEdE7jkwwq2eAfgO0ht56C
         dhlc+A5TLhCuwLFXDcMnXrEXPsr293eWTDBVZ5djNF2B9IBh7/qMIaCymHm5EFmdJjW7
         SzmykcsoIwx8BX2p7pnJGeQH7EJs87Qd6sorv7wY7VYoNEwutMnSPwo7I8uAjF14xgmk
         6E4WrHH0XDRo4CXzn3HpBoZ9RVLiH32VLQvCFRACE9WPSdv5uVlgQbQYDOixaHXK/RgK
         s3eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794964453; x=1795569253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IRjaToXFJCE4Twj+Hd8fl9U1nDslc5RbTkQ2yvucR8E=;
        b=tFXYHq5VnRdRY4htvylxnPgemtubvGNEkMBNtc2Fc/dJmm0D6NEfLTUgQSWKgyVBxb
         lIp8yg8zSLDnwbZ1BpLSAjGbPRii72g/M5GYhoqYACvoCALPDvFwSjFSE7ZpKLmDJlvH
         TGHFvylLnO68JS8CmFv7G/2ygtlsUBxdOadhbDlXZpgavpRW2kKF+Fq3d7NV/vJ3zLq9
         248WZhEgXfxmFpRTvcr/Zo29+oTN5JJqMbtqO4Od4QCtjes8cVjlv1uBFwzM7jmt0lth
         wTI5Vvf3WrqbdtmgByM9PZg7ihSvgLAe4JHLFZSupDmQlcLhnJRLE8E16FFoATLdFGIY
         Vu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794964453; x=1795569253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRjaToXFJCE4Twj+Hd8fl9U1nDslc5RbTkQ2yvucR8E=;
        b=J4djKqGFi8HEUOrAbbWT5kFrWDZD7wjiTMnnw0wQWmWJ5Iukd80PCDqqw+5RdFS7ux
         6ilHX49Eal3OADz4u55nds8q6CwrJPItN2AMD9vi2FmUrDXSGrvYoMAH1nKgdV/NAcGX
         lJqzZhhosjWR8Hol1Ftnqzk3JqaFBV9rQzCCfm4/XoouFDXn103NWJOLmkXMYoztmJJ8
         MrfHH35TtfBSWlQAI5iEH3UwtJWf4+pptKYdtNRX40wFxpc6iSP5/f1L97jIdNVQ+5LU
         DZr0VIdV6EmFs3iOoKYfIXZIsul3LSzUnbbXge0+U/WdeyMKF4fxbVfSyw4Hb3fLII/x
         DVBA==
X-Forwarded-Encrypted: i=1; AL+hErHRNY9K9Y+FZXzWfnH6RlLEtpdDQNVKDbaYodiACtrbEvevDLthtupLR9bqoNZ7I6wctk0I9ICdjANAhpk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+hwqadlHZ/Sz/96lAMWWmcPr0xWMITZqfPXhSVoDrY2sUzfL2
	jXVQOHtw8314tYyhYHSTIypXUnKH8MDpaayi9wYb5vVKJbjrTC+3Md34LdypqbAF6sJvKN42813
	5UCbVUB9roy6CPhnLtONtmHPENHMf94ZuP/7rGfSgXA==
X-Gm-Gg: AZFdTZcOkCv/gTs9YXWXAq5+dv0scfMMO9y1KWD3ze+v4sKIu6TB+5TUZP+iZrQP8NY
	TIbVVvWL5wYgcKj3WY+eD8GZiOYKzuwj6O8tcCw98tneo77qpbFbyWSBnTEKXwXLnmTpIfrxtl4
	lMdIAVb7FgjdeqLWXcXpt0Wta2x7F7cT/H7FqgY92P/dr9NCgeiWVm1bg29OmWIG1cS6TJ9QJgS
	1MqlzebyxXxcPToRZQDcNsPr8H54AfuGksYP9rWuoo0I/P482mjoiTFp03M9NKqjSCtvrc7TvRE
	QQjA3jBCrzm5dfgvCxVn0l4Z7xJGgHpyAwHv7n+RE2qw/4OT2px9+grx5kidIqJBfNv/X1SOK27
	+XkMzt6nc0++iJ63UozaxsXXElx68J3ISuQ==
X-Received: by 2002:a05:690c:650e:b0:8b4:dd2b:10dd with SMTP id
 00721157ae682-8b4fed9b538mr3480997b3.64.1794964453487; Tue, 17 Nov 2026
 17:14:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-bluetooth-objects-candidate-0184-v9-4094fa28af7bd56a283a-0@gmail.com>
 <CABBYNZ+-DMvdpQPTMfR806ZaBx053kg_00q7kz3WCTucziQDxg@mail.gmail.com>
In-Reply-To: <CABBYNZ+-DMvdpQPTMfR806ZaBx053kg_00q7kz3WCTucziQDxg@mail.gmail.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Wed, 18 Nov 2026 09:14:01 +0800
X-Gm-Features: AclHuK8bDN3YfC9Q2EzKtpzaN_Hcmq_vPscZqBCg3TJ_3iSbhyiD_xdZPyWIrBc
Message-ID: <CAFRLqsV+e_+Mi66BacOSHKj7R-cd27ipTn+TYXUagHJ9BLvV5w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Bluetooth: SMP: Serialize root channel updates
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luiz

Luiz Augusto von Dentz <luiz.dentz@gmail.com> =E4=BA=8E2026=E5=B9=B411=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=BA=8C 01:23=E5=86=99=E9=81=93=EF=BC=9A
>
>
> netdev sashiko instance found a couple of problems with this one:
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/pm-bluetooth-objects-=
candidate-0184-v9-4094fa28af7bd56a283a-0%40gmail.com
>
> --
> Luiz Augusto von Dentz

Thanks a lot for the reminder. I didn't know there was a netdev sashiko.
I'll check the report and address the issues in a new version.

Best regards
Cen Zhang
