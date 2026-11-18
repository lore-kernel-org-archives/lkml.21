Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031373;
	b=5dmxkqc0locUe+1fAiNeW6i632Vg/+idYjrDMjam22EO1iDsfICosPwKFlfH2wvo+Uso
	 KqTNJ6aRCB3eaE7OpNSXS/Rfhjcpxhfb+K9arC3w0jC6ijMNKBbdUhwejATnx+wA+JgUm
	 Q8zlgGgVoe8AZmMPZPddtojJkqhNafa5xx9VofQZUBNNytlZt0AvXV6iVOkwXOmA1iXee
	 j4ro8yhns1Y8kSF3QXVFP8p/wLvQ7TlMK7nXGeyNtae8vp+gtodr3zuZPfI4es8Lz67Cr
	 pPZ6Y5Xy9/SFyijlSYP46Fp0ncCi9mMa2x/sOWm/rV7qEmKn1Uy5K/C4QrGaDwfpyTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5z9WeWVp8pZ7m8YhqVv0OCEHCS96QI2xcezf4P1GqsI=;
	b=2QqdeV4K3P4RW2zesOCTdijNZxpyIsqRjIIDHGiehAinrnVQMYcrGMhQFIQHi9V/0y5Q
	 0rgMyoNRtLuLQa+tdLNe/GLZA6soWvMiZcUqwbawNOZPLUqKu7ItlR/jH2ZU3oTDk7yOJ
	 PQYbPa43Dv7AG9cDELlh7bZ7tpeU23O3z3j2ou5KQavzLGyT50XmiFb229Yq3wf3KHtsk
	 LsnEf7DUFDVuDxSrYY5Mve8jGaw7oNA2HAo7tYtMyVNNpGXW6TmNzyR/zwR5kmraNlVqX
	 wDjk4QCLfZSCrBvNthgWIC9YUXRmaV30jkARpa1G8TiI3/6PsfNpPvaQz5w0z2Mzwsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gr/DORDf";
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50FB60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D50FB60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gr/DORDf
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f20b304c0so124883985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795031372; x=1795636172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5z9WeWVp8pZ7m8YhqVv0OCEHCS96QI2xcezf4P1GqsI=;
        b=gr/DORDfy0XS8kEJrTf+/wCUcScq1jhMGVH1YAJj1dTNSzy0TIo1YZm0SMksJBwIrY
         wdScUS1DxnTUCWbuIat7otDfODUsNSne0VajYQIBSlfh0ehkTtF3dHqWgqifR48yMesc
         E6A00xwwOVooEQTbx6KuHkO/Mriw6Axb4gFu4p8jFMEd2QjEW9jV430z7Tcz4SMnmKrq
         72txddK3D9XEH5cZIJHYhvOI9iJ9qbKIf9oMhKdj5LfLcKVSsX0ltHTTkylrJpzaGcZ6
         ahgzaaVsgjRnRLvfI2bRKSF62ZsfFlimUCUoD+sJ6VMrqfw+uewaOJNQUjBqSGTq1JyQ
         8nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031372; x=1795636172;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5z9WeWVp8pZ7m8YhqVv0OCEHCS96QI2xcezf4P1GqsI=;
        b=as5R0gE1gvT0WFLGBl4EYXZ4kLdLIHxkB/V+OTonpS1bpO6HURdKM4BNPRMXJedcyt
         GwVWzKuMahnf4bnFZZexvyM129b8kEX3NephLZJNes+RstF0VkESPoe9GDg1ms2C/guS
         XC7i9gZQeiu/fx6kx63OsVwqf4KzuSW4VNEVN0yWO30pM7MSlvwFFxOXUF7JNdbiwVIZ
         346QpRlMJiuVN/BfnXvUFBZwCcoDTnC1MxwelbeCENnCs7uBYY+enAOpJPhN95H1lKe0
         jRDvggJrtzeiDce5JpEuGYBK84ioz5nGXyj8IDRYnKcLiZJYsybJKvPcDhYkAG+E7v0j
         LgTQ==
X-Forwarded-Encrypted: i=1; AL+hErFDSzBfFuE61gkUrNXrKyTowT8No9u1pgHKJMbvVORb3Cn4HfPwSweR+Up6eoMycc3+OdK5Z7FxQfFwLnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JSWivOWb9PiuSKnNpA8uyiuPju7VINZ1NEvelRS/VbAnpQ7BR
	PyqezoepMBxe3Ttnq6hG5lB/o99vlBlEb0CP9LRZTqewS1Ak+TznyuzKPV7MBw==
X-Gm-Gg: AYBFou17bq9xHZ0bBSf+yT0d8Nh0jdOOcbtXmcJRzmMb5/L/xb7+c/whiSFCs2L4+vy
	XMep8LhOpkVr+8ZTrIMRaHuAY+M2oN+Y6LnNZX9GpRV6feeN1TUs8539JLEmr9ESmk1zkpzCpAb
	GV1x++gJXacbL1YyuCTFEDOrsg0lKsDL2CqII8iJKmxQ181KP1WcV7XoqQSYyYC7ih2QMz8OYZA
	F9uaOrSu4Co0KnOjdFkwtPcsxLjneIH+1kXFxzS6WIa9vx9+rJihQ7BHUaZkEfMdF6NBYhbuQXq
	ZBi9q0bCTCxASifJkjZuWpjPY4t1pJD21GlCJZexFFb6YD4yAM1Nc2HFVT5wlAVG3aM4ptYIlRb
	2n9m4rTL3BHH3qZ47OI6cSCDycQvGAYz0x9PxtsaKs17Z266+GmNWQHPCrg0XMn7D7g1ovGBFlL
	qqKcNZhRwhzgRhoR63ZE339tE5VApxh3/hZLRKCZHryPHh53m+WGsu0Io/c/L6CJQ09yHsAAJ+g
	OFGuoJY7Ad0PbaAhjBWPOM4a/XziK1xxLmuM9vAKPhC57YYhShSDSFWmSj7LZCe6oqY/vQYEiZD
	L8rHp9NcWvd/UNmLDXjsAAkdr5xXk2D/R2Yml3llsqYPwi0c2kM5H2406KTKhDHQeOwkeP8eH1r
	4JQ==
X-Received: by 2002:a05:620a:272a:b0:949:7bb1:ac5d with SMTP id af79cd13be357-949995a8346mr658000885a.38.1795031371742;
        Wed, 18 Nov 2026 11:49:31 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b743a8bsm257359285a.17.2026.11.18.11.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:49:31 -0800 (PST)
Message-ID: <30d88b7b-7a34-4fad-9ffe-84f2d8a927e5@gmail.com>
Date: Wed, 18 Nov 2026 11:49:28 -0800
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
Subject: Re: [PATCH 6.12 0000/1756] 6.12.119-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261118150007.957976754@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261118150007.957976754@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 06:35, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.119 release.
> There are 1756 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 20 Nov 2026 14:55:44 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.119-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

perf fails to build with:

util/annotate-data.c: In function 'global_var__collect':
util/annotate-data.c:731:30: warning: implicit declaration of function 
'die_get_type_die'; did you mean 'die_get_typename'? 
[-Wimplicit-function-declaration]
   731 |                         if (!die_get_type_die(dwarf, 
pos->die_off, pos->die_tag,
       |                              ^~~~~~~~~~~~~~~~
       |                              die_get_typename
util/annotate-data.c:731:71: error: 'struct die_var_type' has no member 
named 'die_tag'
   731 |                         if (!die_get_type_die(dwarf, 
pos->die_off, pos->die_tag,
       | 
       ^~
util/annotate-data.c:732:50: error: 'struct die_var_type' has no member 
named 'from_alt'
   732 |                                               pos->from_alt, 
&type_die))
       |                                                  ^~
util/annotate-data.c:743:44: error: 'struct die_var_type' has no member 
named 'from_alt'
   743 |                                         pos->from_alt);
       |                                            ^~
util/annotate-data.c: In function 'get_global_var_type':
util/annotate-data.c:801:26: warning: implicit declaration of function 
'die_same_file' [-Wimplicit-function-declaration]
   801 |                         !die_same_file(cu_die, type_die));
       |                          ^~~~~~~~~~~~~
util/annotate-data.c: In function 'update_var_state':
util/annotate-data.c:839:42: error: 'struct die_var_type' has no member 
named 'die_tag'
   839 |                                       var->die_tag, 
var->from_alt, &mem_die))
       |                                          ^~
util/annotate-data.c:839:56: error: 'struct die_var_type' has no member 
named 'from_alt'
   839 |                                       var->die_tag, 
var->from_alt, &mem_die))
       |                                                        ^~
make[6]: *** 
[/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/build/Makefile.build:105: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/util/annotate-data.o] 
Error 1
make[6]: *** Waiting for unfinished jobs....
-- 
Florian
