Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102657;
	b=c/Iabf5XIDZkbD2Dy6IcU8Ye7K1sgyHBdUTqWDDx+5O5QPZahzNVJpBpwPfEQtePpL98
	 IQTgTScykb3oiN+uYd/GAldq9FZ1pfKr77xUfPCd2vi2Whj/azXejUzwiDfg4XrVYJcGK
	 +5boPI7e30qw5Hq/vpwSLzWTMPnhpRsHfc7vEa+lq4agzkKD06Sta1afzhfmMdWnnOmIv
	 v6KwSvYDhrSS8cBLrch2UP2rswLdPTkvu0kVNTaNl9jR3Vc394iqO6CrkHxT0sTATUfxH
	 YpdkkR+o/CQayd7g+k4rTjO7lOyyEM6UYUJ7ZwpRVSg4ZGyvdy1pRzxFq9UcH1UnJPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TO+8nrTIMWn71QJShuf5TRZeIr14Js9cHAmW6jrwfig=;
	b=bicJGojsr0jsd2bd/51MUa7GLmN3eArnL+eIOiEsszR38WGDkMTd3oVdiNi2C8+FFKkN
	 1Of31CSCssZbJyfvVylAIJ2Xr5j19yu47NIxevsMXh02cS+Y5nwCwrGdqeU8H21VZd369
	 vupE1SVG09qjsxFXkPp3YCAKVjPIMzClD1+9NHxk0okdfZRkeu6URxIp44BecFeOJzLpG
	 Nz3ALujCexnG6yOfE7kmSrNleolrQCZzVVd7bNXgQsFAUuuRTtd/6erma7TY9YFaYQVNo
	 TxRR/8R1GaRewlxWw1b/QbNROWfSyrvDarFimM7cx9qv0EEovFX3whbS5kQK1GCQF/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fwdSly5b;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99C8606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D99C8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=fwdSly5b
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-71aea92f666so1533850eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795102650; x=1795707450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TO+8nrTIMWn71QJShuf5TRZeIr14Js9cHAmW6jrwfig=;
        b=fwdSly5bIER4CrWfimn464C1b2RNV7NPEgd26N5vO6efQMYFpRNiXHNiXdZO/HHA5t
         UmpD4jGipvU61bdPSvQPUZtXOXiNFCRC71JkDEUqCPTcRnjO50Lipz73F63aXwqiDowj
         v7QLciiFTd6Yas7zduuiDCkuD0jnn02gyJzsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102650; x=1795707450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TO+8nrTIMWn71QJShuf5TRZeIr14Js9cHAmW6jrwfig=;
        b=zqKrXow6RPej3zjuUtnjXUUz8JIJlz6QQAx91HIZSQahUta36QBrOTunr7AcoiU/Qo
         rXT/BT7URTR/hzKWNLJIDl7WqJxjOD7baSphobgZKWI7KNKTPcSiDJHBx/09yJWR1tuD
         fcKevm/j0QX7fZKKgb4IuAUZtzZaeSGSya1quQCPcBw0N4LgYCvWDM/ctROqYVM86xyk
         fET03jWx+vfUfNsVOV4ZpNPlYq5MmUnqrjcJd3Nnzt5genFBK1QVCjVNi6eBPP3OOxyh
         LabQ7r2YWvvpqvJWSmsTJ5vmgA1fFycs3F3LimuQFqQuCOwpKMeOPXq8QyEOny5Rs63M
         +AIA==
X-Forwarded-Encrypted: i=1; AL+hErGoAhd2jXCLCwGv1548Y1NaQ30xmw+g+GKRgSGoJrhPkS2+XqcEKrAEWv7W6Tor3VSzuzcUYaPiKyAId0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pUtXFOcpLd06SkL6qr0MY+4xIgl7yug7qoRf1Qh9F4X2hm2ct
	UU7Fd9h1Z3AHegsbOvNgly7U/KrapzYWdXhKrWFg7mCegx3IevbmXiVoU7HLHhG8Svk=
X-Gm-Gg: AYBFou2oGqNytPwxJAnpP/TXfm7paO87c5g6g9EvelWmDumimmoOIAcqRUyx4b0pp+W
	L4sPy81Tfe7tGUgvYbV2mYGsoXSlNISP9QU/vbKVQwFNVVrzVDpzwIqq1GmJ265IvsG5uXB5JYe
	6K6RW7WQNcVi+lrp65b6aYfj/Vr+s5cLZCho0U2tO0wGFX3S3zcRjLbE08WQ2RqUNUDG6CMwr1E
	noTZl2RpUrBah9dcMgo2VPuimRtU525LfAsZCUX0/M1eklcsWPKyAygMWrMfxoh1zaqtU03Iawz
	9ehO20HSDmRbbeh7Z57x/hlJEcS/v5YcYiNURNKiHJgVKiczB+bDs/xZoY/w54VgoplR+lcRNh7
	3Em0aEniWOPxlGuM4RbOJCBEHVQrKo4KzMGDeNL+b70Mn7pOAgKdehqKcGzLIRgoupnRXsG9J7s
	iNTiJ1xgZDde0GNx+p2Wq6fj8z1PyHOqLPay7BfqnebjXv1v0HztELkpY/xWs6ERDs/DcN9o5Tn
	rNELNYPrkY7rAR4RuFB9YcV6Otmxr/y9/wRMkVFU7Dfvj0BO0bZbZLoAUTjHrNX7/jXXdYeq8iU
	gefZCYwy61U21eqZFswLvzJkq37vhE8uX2GMbw==
X-Received: by 2002:a05:6820:f025:b0:71a:ed81:a2e4 with SMTP id 006d021491bc7-71b18293191mr5288368eaf.12.1795102649706;
        Thu, 19 Nov 2026 07:37:29 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01f71d6sm5008625a34.11.2026.11.19.07.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:37:29 -0800 (PST)
Message-ID: <0d95318d-d9b3-4732-99cc-ed9c96c20b36@linuxfoundation.org>
Date: Thu, 19 Nov 2026 08:37:24 -0700
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
Subject: Re: [PATCH 7.3 0000/2651] 7.3.6-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261118150247.972732815@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261118150247.972732815@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 07:20, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.6 release.
> There are 2651 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 20 Nov 2026 14:55:47 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.6-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 
Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
