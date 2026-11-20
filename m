Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205751;
	b=iOQ456k9p5MWxiuCuTwWYiGSnxFxKch2lpsdXy3i0BM+CsX7l8XaBVMRbncax4AMpvlK
	 RKrKBNp7bfVSNQt7RLnBU+PxJBAcVvXoqOilQ7NFx3sGvgKF1RWvEXRulu8Z5Q+bjOiri
	 fnW8JrmGs+9egTY/Ln+yMOGIuPsh08OFrpU/dwAHH4mp51yAGWk+aOYgh5TvG+R82HITV
	 RmM4FrUXqQ7f75XmRbDgAC/CVKSGmaSC8WH7tNNDu6LHJF9bV+oI2d13ycZWhqDmS0hHh
	 xWap+SrWKkMW/jnZ4Bd73Q6o9gB47CReBLPiMECZcUpfKZCQf9XrZkT0aRoR7qV6H8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Bmres2veI4WmKoOO0djqwZlxjU4vTSr8LiYOV14rpMI=;
	b=2GbHfgYVkQjhWwdu5BU052Z39hq0AUi1ePrTtNZFvh4Dwa6Di4pwB2ToKlVTGW7aOjLz
	 3ZOKdde87R+4/8ZZlowFzFZ9AvO1fAgXh/I6y7qfz7z4d3wnLbm0gWB91U6zFC+92m7k+
	 YEls++pxerYPOfLjhUY1Gf5Sknvk/3V7eptEzv8YJrNL1FATex10WY0qkhYx8Lqn6R8BB
	 Ev701nhDCz862u73x16qDFbzctbos0CkayGfrw7edpdRYgHCfyr9KCur5aW1odZeRO1ia
	 CtgBbMZ5yxKENoeanHPNs6iX7vZwsbbW56LiyogJO00NmNA1SttWtuyiM2MfE92pRRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqEgBK21;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35459606A6E7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35459606A6E7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqEgBK21
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53634b8328eso12899041cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205748; x=1795810548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bmres2veI4WmKoOO0djqwZlxjU4vTSr8LiYOV14rpMI=;
        b=GqEgBK21StO8Cxd+na/3iiN3yW+IrI9rHKRE1HvRhb95+XwkQmrGisIz0yzLAIaFNy
         NpJ2dNGzkqNEZ1SZ1WFUAYGLbyQ+LzQOwWuZbi8L487BrUtOh9lOzYdA+g+zlichDGq0
         kMqpxk6aRRrEPMoLvS+XgJ/QYdsA/A7qpwxdVSfhkMLKIchu6NvpyjlcgnuC2lOUY29I
         48bqAnwtN1jVGJ5AYZ4A+DB+TJxvFtuEyGURmvOqezNtYIX/+7SS9keoRkBJAIL/ALpi
         rx3bkx9wSkTcVW0UuO/L3OPge3pxKnO+qkpg4SH8wuWBQf/XLTq8CEcKvPJ2Z5Zn4cxq
         MKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205748; x=1795810548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bmres2veI4WmKoOO0djqwZlxjU4vTSr8LiYOV14rpMI=;
        b=Z1IV8r1M81C/fLHIo4VgJHy3IllpLnUo6XMPj+v/1wzFe8BtGttv4XcQ1mxzL0wBKt
         oNePgNHJ3VWXyA2PZz+KB5xGUVmNeybE3I9aUhUqyvLs4nHbcBExF3J7EJsFzmgt6Rps
         FmS5Q7hw/6ohlhiNk2J/8avv5Ow6TNNZKQFh/pfgj+OHmtM8fgKrCjGUJdQ2M3I1Pi6G
         OzgVgxTW6WCxIjjX/ca41kf0ey8VCsE0Xg43WwgVVM4PgBI6XWchWeQxCyv99LxyEDX3
         sk0KkWeKgMkDPNkSnvWaJjolv+qFZ5+UWJYvnQN+NJS3wTHo0GjL/RvZP6DGDztiNafe
         IREw==
X-Forwarded-Encrypted: i=1; AL+hErGgMgOc+jvpj2+8bKriFCDMiaT+juxh/0RGVECSZj5wAmmm5e8lfbxdwIaegA7o90RA4TRDEtuJLsU0h0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z90v5/KYUtqVOoEv09tmFNzG5OWkjBQ+Y42kxMVIHq6TnPd4q9i
	9hSszLiy5e01uj2hNXZJMP9VoMJ4YkXsJmWnEQS6V7ttMUWwu0FnHvHk
X-Gm-Gg: AYBFou3JospyRWJJ/RriO3u1lDMZ0avtd/1eMjg1HcmIxaJpPmOZHLq+acckoOxPN2N
	/G/2CUkbHafz88glTVAs3VMuSZdclI3DWdvJx9m7CQFsZVFduW09rCVtBfgzu1AUycewFRdm5Tt
	2Ap35hEIuyE6d+YbwQ1tsppJb1cM73W42e1YmJ1GLK8LEJ3rE886lPJgWSyISpsxHBiCeEp8f5E
	u8uSeH+1NML69U9fu5i+NHmIcqxZr33uHj161rhaQy0i60TgCCH28/XJtGCmG7RtXxdAeVLhgWQ
	4P1zLx1dIlvM3D1Cct1eqgQu9ZbOlLk3Cv8N0c3IIiAyFqfbaYYhoZsog4VWgQYCxG7WLhQFN7i
	vVZAJvql4KDf2I2seeF74rlDZ0d2a2cVzV+Bi/TVwxbaRbnV+xwaAN3T7S07XRVCYqwEEyRyTqF
	ssGT4fhdQZM4RZuoSdJ2YKQthDqpFF+2tJj8lBHWdVndK/t7jgDIdZ6q+qVPY8gB+6haD+AgyES
	+ws8SPRxtkS3hvsv4WhOHzuSudFg4nMyymgdBFWIabPoQ5ucoYLn2SzmApPRczi0rz2eCbvq+6D
	Xtkbv0IBlfbFitXS7qcWvba8k1NufvNeHbYsdjJPQifHejBThVKaXoYb43cXhVVy6zNn/zpMT4g
	dOw==
X-Received: by 2002:a05:622a:230b:b0:55b:f621:e7ce with SMTP id d75a77b69052e-55d76a26c80mr68335001cf.25.1795205748149;
        Fri, 20 Nov 2026 12:15:48 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78807b5fsm31219881cf.6.2026.11.20.12.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:15:47 -0800 (PST)
Message-ID: <ac9a7cea-0d4e-4856-b796-03a1b887476a@gmail.com>
Date: Fri, 20 Nov 2026 12:15:44 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15 0000/2178] 5.15.226-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261120055015.328810133@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261120055015.328810133@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 21:57, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.226 release.
> There are 2178 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 22 Nov 2026 05:44:39 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.226-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested on 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
