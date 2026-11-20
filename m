Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795165261;
	b=WkuXLMdvINqimv71OZnxAQcjeQZShLXkXilXID7R9gw3SPzdXGc1rRCIi94cXrL5DGe9
	 iK4mZED5oedMYlq9e3S3/g34SgbRj0IdNdb9jB9XTF7kRjhMlpKzvhErOnRXYhB/SAiwM
	 qKrpSrQHCrrzzGcxePRIwVntdGrk0CCv5xEYF29GoevPr9ieRqRvCFVxa/0ZMHq5Gnt8D
	 ttR2sG8CDgPEheJid6tP0rSbrTRv36hg1Nitwe/oNrOJzHTpByZNS6Ja0qu2w/47MlTLx
	 2DsG1hs1RrIcUTeuq0Y42CYTd7QcOEV8JHL8ASWYtMU3MqHpzUm3qNcj3ZSEkUUCwSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PZieRENVmUX5OHXGvmzJIcsoS8CWVu3mfuhhXe7ha4o=;
	b=h6qC9y4o5JZnTxnqDoBu8uWD3xmuB8IPMZdUoNpkH32F3DKHtlism86yk1zMrLDfUH18
	 SP4Kkp5ibYxtUL/JP+ny8NOPksaSVF4iNqJb4v21LYeDKrHOsTOh7SphIAxN7YKoxPafY
	 IlnN02LruIwzKzipObeHsR1j49IcPNOxpUZlk1njpA5LWtGC1ty+lJfjk+Bawp5D0LFOh
	 TQCWG/gbemKfK/xwgbVm1lAP4SmcBBRLx8OJ8om/eg6hO4NoFe3ILc9IB5hHyq0hCh6Se
	 Wk7abwc2avRZnbApp+3xBlaBzBtIEb5ucK7HhZVyopSz232pHU/t/wWXxRiqPwBkPpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=futuring-girl.com;
	spf=pass smtp.mailfrom=futuring-girl.com;
	dkim=pass header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=Z8BgscY9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988E9606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 988E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=Z8BgscY9
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d427836e9so101631966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:01:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795165259; cv=none;
        d=google.com; s=arc-20260327;
        b=VVdmHXxebM5IzZS4YAatTAgNfN+xRj9ac31Oz17sQCUsbKQ0R9UMTqaVhtCvObKHs9
         5cxjGDN00XytHV1IrECsDmFu+AV6eLmrnTKvyYrMRbDBy6yLMTaOo+vWtW2nu1Tv8Y0A
         dzU8Zcq406pRwTMZTSTTjdBRr6GxRTeY0/JUf85pprfuU9LfC1OIximV1+qcajI/2om3
         +wzgrZUZHaFqaJJndszrF2DxUtkfU6tV4QEwmIwLFhhiy70rLgnnwoxPuO/e63SVbvqe
         hdYBF0h9yR3WCdZTkXXMhv3BjMU74lKS4Y1fSuZIvjUgOsaUdCXpXCUQRsgiLC3N8pjf
         j8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZieRENVmUX5OHXGvmzJIcsoS8CWVu3mfuhhXe7ha4o=;
        fh=HyyYcWnpwdfVOLVzc+dzsvyNkHWHWTBH1ZQkD7UREFE=;
        b=GGSJMwFNpqT9t9sVXya2nPujpi4PzgAm/fJU+kp5JsWGk37mM3PYjbH67sjjGjQGgm
         yCKPFsqDy68NVsR/i42x1Ht0zzvAW+/QHvyCaJ6xpskHIbkiq39MzZX8sahrqLhJzo5y
         XgaIAl7xEBklW6zASJpLonxY0+2JHdJFJWwJ7G+gqfKam9YQRtAvfVdDieIA89LCK1uL
         IDVuaWXkZpz45Vm53B9oY4Av8K85rM5kQyxR/hSuoeBEdQO8vJTuAgGg1BQNGkj8qPkw
         2n83aeXSQbFt68KBHR4Vk/eGRdExBf7RTFr/I8BUMPLxabBGW+vZ0FuOVPy9Wt2YM62w
         N3TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1795165259; x=1795770059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PZieRENVmUX5OHXGvmzJIcsoS8CWVu3mfuhhXe7ha4o=;
        b=Z8BgscY9/G3ijVbCwygY0Yd337nhLe18Bd+5uOZ3zsKqXXymvoeoIeywGgl6rlt8Wo
         OXbMS0NIKAcYL+f5s02X+TlFlXpNhe9ccM40x7CEyMqlTDXxytBSPFVFL1kI6+dZeKml
         /UbAc90eQaF3ip7q9UUc2GqCT05+qFsgfsV/j1YvsVAzanZqgz+SuKNLZNTxedQdLaFp
         jJR9GVfwADTrzuuUR2ELE6iMSNNO2pnaPoUqD+hmV0AOQeA2ZJqLaMdPT4rxWCfM6Rqg
         zZKbrixug+C9Z/vHTL+3hjeokbli7hhlhU782Ctq4gtFk7idNQEGpHQC/UNqgkABzCG0
         kSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165259; x=1795770059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZieRENVmUX5OHXGvmzJIcsoS8CWVu3mfuhhXe7ha4o=;
        b=GYm0cyzSutSECxyJkcQ8yqox37e+5SdMrbjpqagIzMkiyfb4MFC4VtJjabA+htT7aQ
         YruL+1eJJKerw84obd4Vled5Q37dhcKHvAXFwQYQaIcVJa12OdrWUBWtQSgPLJDeji4B
         mYAIci/f3/ztIDLuzPhE+DRilzlPqPM5gBzcT3mLMZaWHtUeiyRptXzGh9+GBLixzUbg
         isIrwTK57EJ2W9Ow2DFPHO3Ehi3Yu146RJsdelfTELBDhLMPD5r3O1atE/x4WlkLRCV7
         bbgOYbR/zAZMZzYm4Y9ODIPax43dBRBAQOyEBnaMheSJmVskCNDbBSzjd3wz4oJzjVWh
         AImQ==
X-Forwarded-Encrypted: i=1; AL+hErHPf89A3u1BsucAEDaQxG6I+B7ZUEBWjuOFP2yw5KDMW/V5wNHG2Zai9ZPsbzxuP7ie310EcNpGWUi7VuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uaWRcXJ0vrE/myoPNW+9NxHNr0qykHJ2SsHUtWUP+ijKGgf3U
	VI5uUJ/v3GvW/E+CKZboLQFjgxYml1+cp2imwOBu8jsY4PSpeSgk7BXNpkB0OZzKv2AEhlS45s8
	UMvZ/xuIcNhv58AMWfzXCygD+ecczzK+mz9oeEOBcrA==
X-Gm-Gg: AZFdTZekYTRC+Dhcz8abDx8TPYLLPOakDdoVQRC/SHGfxsX6YsGfF4QVMks5ZhEsptI
	S/vbm2ZW+HUuN5lHrTAEFQS3tqBPMAqCZmzDKZCQCImdDWSDV4atRbEsf12AdONMNCWraypsOlJ
	CJwqhG0cmeVEzXZ4mecpmu0UbopZM9+xHYGpRcGUGqEEeZEn5Jhf5f+LSbMhtvUVq0n+glvvFih
	UWdX+u9zd/psO5Al1h6JNhfVcoK9bcjcw9plAjsYa2xjT3q8u3zyiBNgXtSG3hGK2co9Lvmx0tY
	9bc4rgDOIxMCuGF4QlMnS9z/KD/fjL+xrJwkXFzLwhgymNrqkL0jIUoj3oOnif6QXVs49inhSwH
	IP542etJy9562kmZNUI1O5ggaxFYnwfjzhIzK
X-Received: by 2002:a17:907:2d9f:b0:c50:f0f9:ad74 with SMTP id
 a640c23a62f3a-c513a99aa4fmr235834066b.9.1795165257779; Fri, 20 Nov 2026
 01:00:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120055248.913352689@linuxfoundation.org>
In-Reply-To: <20261120055248.913352689@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Fri, 20 Nov 2026 18:00:41 +0900
X-Gm-Features: Aa3M54rlZA_OBwjiZKWCvnO1fS0Oy5SCnCxiMl_HpsSggZDP4dM965l7S2Cnigk
Message-ID: <CAKL4bV6kN20uHLeG=ZV3FHe2HghsA-yRp3+YgCVgTvGybek5Hw@mail.gmail.com>
Subject: Re: [PATCH 7.3 0000/2642] 7.3.6-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org, sr@sladewatkins.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Fri, Nov 20, 2026 at 3:04=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.3.6 release.
> There are 2642 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 22 Nov 2026 05:44:39 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.3.6-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.3.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Linux version 7.3.6-rc2 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.3.6-rc2rv-gd6a022cc5dc8
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Fri Nov 20 17:29:14 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
