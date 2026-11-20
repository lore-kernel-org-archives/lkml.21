Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795183450;
	b=u2k0sPLw8bzx9b5Pn37nFQTYYgMQyiblJWbdbTOfgAnmoriuRyiXfx/00cevbxDVHnSZ
	 UKWsyhEi5GKE5VVQx7CMVflXm78qf93V3PvyZIICEABhRwl9/s7lf5qVvFOCATCYOSh/X
	 W++WXPlBI8RTrwrffKopWr64vtA1SdivkfA8/drs2YvUz1RJ2/XBbj8y6lhMMvVtZipXu
	 oubRG7Cd6rLNaLSIkXqLjwh5yXFJjKYuuGX/MQJH82VSRBCCvik6MSywglr7oFwakDNFi
	 pbvxqAlU/U5aNDmt2B+mwc9B+bM0InkaRF8MWDlsbIQSrgl7zYI3GdZw1zNZpmO19Pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ebuT+f5EamFeEjXTBFPk8/I7Ne4UNxLTYT0YdYlrjqo=;
	b=uVH52W2/dGp17vOTqZuIl6DBL5Papmn3nbtgWFDtptuQxCom/J2VDSCQm2xpA1SeRg/7
	 O4+hVG4XN1Q3wHvKZGtL86yZbtq52HREhLopK+GRV3w423mQL8W/dVgTeSPruheChId1E
	 o+pbCBR7jpJN3vVG4vSeT/JjR0Ti/ZJjp88y3ScZEFyjUB6ooQzZK5vt07EfldZVFo7qn
	 U0rsJB08hy5+FZEpjtyv3HK+Ne8hqaomhQlbAaxIrdu1ellYBPhHyE4m9verbGSviluIp
	 vSPfRJZtHAxviZx6zYNX104Ex2ackh9nWRGB7ibbDYwJh4tCr7wdF+83oEQztp3/EEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VoYphyFW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AC1606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18AC1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VoYphyFW
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c00c727a26so79235e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795183448; cv=none;
        d=google.com; s=arc-20260327;
        b=lzat0vTIbHHfe0HQN5CgikR+VwKby4vk3BybR4sC8lv/JOFEQRxXfRIpo42vdaPfTg
         K1mnBZdwQWuRjinIeapNMOTrWf2dRB4nhUMI1PJvAJq3Ud8UtrR0XHoX/usyu1H5RgH1
         h6stEJBImj0YGgprcVNpooQRpHwmVn4aAPBm6PIIYVc0LV/obm76o7jg2rIYeKr6bgce
         xCpjHvUt4+YkxNV4tfvGC4l3S798rBhNFvdsH+bqpGp+9SCKrRH+HN6llfSBKE87awc4
         QNLCLW7kS4YsyV/kgVQio7cZI0fhPgfOVk3YCisCVfYwyY2/uZrvoUbtHB0BdmrsGSHV
         OoPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ebuT+f5EamFeEjXTBFPk8/I7Ne4UNxLTYT0YdYlrjqo=;
        fh=A5p1UE9cJv+VcZX77oMg3YJjl7AgbnQwjz1r+V3hJgE=;
        b=XWKnoYX0jv3eFEQDZ26DUSac+OQdJeL7HKlb+FuOSn34GHTDsMvD94GJGLKuGz7fx4
         rFdhR34PDdu56jTxW97j9oFzy0HTTLe4tvRvivHFU847osHVAoaJNcVQIIvxRs/uMTft
         jVNm8yt1TbH61mdY9sg26ad4x/jMEhKLi3D0+6Fbo+deWcbVAmOPVJ82MfqEVx7x2Hy7
         qhkDDjhWdcUDlPdXV2CvAs7qA5NeGwGOO0/F6I74FNtqIPnihnU45+n9pcVshpLubYdf
         E6Z8Z352UsCPb8hRhx07TMhWe7wQQi0E5e7ds4PQesOLKlt0OXlAh3Vjz0J7jiQvFM3c
         ks/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795183448; x=1795788248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ebuT+f5EamFeEjXTBFPk8/I7Ne4UNxLTYT0YdYlrjqo=;
        b=VoYphyFWXM4AGbcXNiAOU/5SGkTu5veOcuFcWpY6IanI2yTDIh8K6CJVivxrIIwUBx
         vGlltNI+xJERP4f0Y5AvoviqlV0xnMQ5ASom/1zvTqmkZ8b6KufD6ZiorgnytX9LzwGe
         6Bg298xFKOhKs3kCvGeC7eOJR79keAbdT3ghEGTB9Y5NJg5oIzWQtuJvblqRh+0RimdA
         bcZz4Y5YImAUdrB1W5EYt1z70Li3MdaPSlh2mB8WD29ituHKo2UHBNG6iHY3srA3uRRy
         aPqnggBm7RqdDS+ne2vQK0bRqwAjIvbFRhNEiIFuCtaczlg3XsxpkTP5EXNaImbA7oZk
         qSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183448; x=1795788248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebuT+f5EamFeEjXTBFPk8/I7Ne4UNxLTYT0YdYlrjqo=;
        b=BhNooB96TlgdWUf2e5AaUrF9YjgFru0Eho+WFqd2Z/McMxxo6l1lyUwC5BCB0u5FLo
         P1j02gFIzttIdDB+a5KQDnCg5T/1eGZ1sWqBuwFheyLUoDt0g4C5ENJI3Gzvs8LFT4KU
         q+4ofsDmqoicCW73EAbIErPZ4njxlpYHYMkSOyqGl4A69eYQLqmkQlXUumRbfH/5Khg8
         p6CmTp76/ZPMWUmYPuOU1fgUkqZgAesgvmOB8XqI7/HbYzwFENya1fnSKoe1oJURKc3s
         3N3NDT1eSTFBicLJ4+6lBDftQxXMe0fX7Aa776TM7gv+w4vrsqMomyCUpWjOZuy7/Ni1
         H5PQ==
X-Forwarded-Encrypted: i=1; AL+hErG0l9etcx/cLZ3jw7frV7IFpliaFe7wxymvx0VPivSFv+s74zJmPRMywPNy6pnhhxJWysTc0O4h2BiZf0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z903pce/5nFVngRVBSWC+aSSk4iwbU438Zhgun20U24A7po04zq
	UXtKq1oJhDeEU+yW6i9IYugC8ZMySVxKmgHbcG5DkzxzH2OKJwqOf752Wbk1fxQghlNPNsDkIZW
	3z6Q6UV93hd+JcFzGOeIWjmDG29e0yqM=
X-Gm-Gg: AZFdTZfB86QT8jc35Pd57qncJM224YAD1mbuDATbMvo73C91kmf5jL8GQXPhohVf2PX
	ZGJJdGd4/snp9cFDsvTs+Oq5KywszPmBjyPZhzbc/l6yclqnG8x6LkiOZ2MH+B2LXutn6C5WOSJ
	RZra8+3NI1d+ujC5HuD/pPKBIxueyRcW5xISFcFQWQjoMIjs9iOKsUE9jmeULXOTGRe2l7I8tdp
	NDfiTP9cNJWn75eoNdIi5ArpKmOLlfLYWinlTS6kBgTGa8+UWc/u+R8Z3Mcy/mYaq7n/MbjNUop
	iNu0WYyT4d4gSbl25SsDEfSPBCE9iKCu/j8E4npUqihv93S6MWIW9octl5zRMlrIxehvr7lhN34
	CUChKj/Pf1JMkdXahFjVjsHyDdaWaR/Z+ga24KfENiOAOtKoWjTiLXZNCQaHg4SBxGTNnN0CfXf
	FBO4PtqPIXu6kkvVe8UpwfCII1sRieN+TFAT5zfZLBBrLJ0BEZPMW5kyyrQ58akgMPPqKV1LYkY
	ijAagh6u7s3Jz3p1TVbcHA+0Ng5mrnOV25NdlFWetaDnIH8N+/FK0yuoZuQ6zLJQES5REPZBsU=
X-Received: by 2002:a05:6512:304a:b0:5c1:57b9:90d3 with SMTP id
 2adb3069b0e04-5c1bc6d29ffmr1168124e87.1.1795183447989; Fri, 20 Nov 2026
 06:04:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120055200.707545519@linuxfoundation.org> <20261120135123.16092-1-ojeda@kernel.org>
In-Reply-To: <20261120135123.16092-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 15:03:56 +0100
X-Gm-Features: Aa3M54oqTlpP7aqhlAYeu20Jbztbh7rwwB7_36t7sUXGwDuDu1WrpuuSK4L4S9A
Message-ID: <CANiq72m0P8SjfLHKFh+NqOtxanEx1Q61NO=dRsuUwEKyTueOSQ@mail.gmail.com>
Subject: Re: [PATCH 6.1 0000/2812] 6.1.193-rc2 review
To: Miguel Ojeda <ojeda@kernel.org>
Cc: gregkh@linuxfoundation.org, achill@achill.org, akpm@linux-foundation.org, 
	broonie@kernel.org, conor@kernel.org, f.fainelli@gmail.com, 
	hargar@microsoft.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux@roeck-us.net, lkft-triage@lists.linaro.org, patches@kernelci.org, 
	patches@lists.linux.dev, pavel@nabladev.com, rwarsow@gmx.de, shuah@kernel.org, 
	sr@sladewatkins.com, stable@vger.kernel.org, sudipm.mukherjee@gmail.com, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:51=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Boot-tested under QEMU for Rust x86_64:
>
> Tested-by: Miguel Ojeda <ojeda@kernel.org>

I forgot to mention that Pavel's issue about `__pud_trans_huge_lock`
in -rc1 is resolved now, i.e. I am not hitting it anymore.

Cheers,
Miguel
