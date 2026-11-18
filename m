Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031673;
	b=BuIUPUPWWGibDF5wZAZisjGAymD3CxtihFNyek+8hB66SHrS7cD+GnXfEBiX5k8ysjZJ
	 zEFDbha3YjhcExWjb9fAlqmk8B/a1VghrGqFwoLlHH7u9FplXYwvLIgcWw/o7YsEAr6Si
	 nom58EAvIVgwBHwzeqkWGAFpevbarDKkTdt42ZNZ6UGY7WpyBDJB88i/MVTqV60pfg9Nh
	 V95C4Pe4pgHEd4twNubkOavhomj4QTFT1XWYvRSVt/g7pUzChnitIVwHzYEkBguPxlCEu
	 veGl2tyni4EpOlTJOsyspi9bCd4B2C/lx1EP0VDNu/iXzuaWDTNjwCBXchm+gBjox+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i0RPIOg/N02GB/FO0QU0LL8vtzFon8FGCvQcjRptq9c=;
	b=LkXI0vB2blPkcCR+UfEHSV+bYjlBTKpCmNC9wcbo1QGFfdyYFlgi4kk9Q6lrqVV2vn9K
	 Z0RcanCJDTwaVs8Ya/lvtDt36Xd3u6NBK6nOkE7sU8zmNWXCuEVAENZ27xvlAfI6RMY82
	 5eufQffstZtDdAgPt2GKuXsQjCEJAN9xv3sGVrL2aUX4oRXiqe3/rPIWYmks3ZC9hFLkL
	 GqJ7l00DOr/RjvbS+GQO2ERcW+6hpTEvtLdSWUxpBQfZBj65mCMO4/M7CkoT2bWBekV4f
	 p45VjlzEXUzeR70lLtbMWd2M55aaVu7typKHzF4GBgmbFU54X4oy4+h+87T75Ct9oSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PnPN+RH7;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D5560A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D5560A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PnPN+RH7
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f2f2edb19so130328385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795031672; x=1795636472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0RPIOg/N02GB/FO0QU0LL8vtzFon8FGCvQcjRptq9c=;
        b=PnPN+RH7pQhbikZJA14mX7rLaH9sPH/vIyKWSDAL6vqRccPUOJmxW/1r1Ov0fvnJRk
         QlNITGKipLAp/5DDZUwCG9FCGzOW1P6G2CeDeicU8evPwE3mtIcozIb+Yhvoz4uPiiH+
         S2gQ008I7WL3vXFUeitwiudL2Q0j1w8UzepE9inLHPto6z6IDwaQ18445qFpKiMJx0Hh
         YYcRNn9fzNtSz0dzyq1VdvisPJsyRgMiy+G21H+0N4qotuyAWqshXUqUmb/2KKji2KO0
         1H5RBxB352BulL3ICkR/MaXmzD0fy5PSi6P0ZD4mtQ0i/E6Dlko3bcqdg5cTQWRMzn6N
         Kv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031672; x=1795636472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0RPIOg/N02GB/FO0QU0LL8vtzFon8FGCvQcjRptq9c=;
        b=mYBu6eCC3DD/7jXl5oCyinsajOmcaZUuMWY7Bex09lCc9UTNn1GkiQnsLqs7aFyGT8
         azi00Q/TPZLgsE+urpFHWjzJu/sJIxPzr9Yd3NrnRMeVrSBGPWKaP1B3ayfFttkpoTOP
         mYEpfHOFnXWd0pfstNWwP/dNmPlSgpKtCw5hzBaJ4ihZx3CNGOOyetJlmwOnFAlCGMEs
         w7mUusJK4oJWGCBYv4v/8DOsSyjCGw8pvfNiBsuSFMIGNODyp4e9iwwS9skoBQBciBTm
         Ji/Tw2qNX0DV+WX7xOyZJOD0snwhndxTzAtRs0zeJn/wqRB7IvBA8n64fhujUHDA/wk0
         j21A==
X-Forwarded-Encrypted: i=1; AL+hErGxXIiTWygS1GwJ7e37N66ookrZCPtZSuoiF2OQe3r7hGx49EIN8Adu4b3YdaDnSUfdutN451W4za9xCa0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Gx/q2uKMEkPnhLh5Pwimip+NaEpYDo6nLxA5Kg76rGAQl3zc7
	v0HTGhN475NoV0TpPWZ1KgW7cpGbIRXlMTBVnWYxkQDC5b6b3Tc6joq6
X-Gm-Gg: AYBFou3TsGOppyhgUH8hFmBwUpp2A9HTfzRy62gffzQ7HkveXj61vkPBOGfmFW2RNI0
	dB7NeyPAEMm6qqoqVsClOgd0h5v9F2NsLg6akXEAQpSWJfmVaNW0XvSsklxtLYET1sWpMXVvf8q
	N8BeWTX/XijlKVAAYbjU9Nw/q72PP211sfkrWrUyzp1kshbWmCtOz3ge3A5Ip59HAu9F0kZ5I1B
	8jR3bS1RuQid3gpORmwmm/8nREADiFM8VFoqKWSZjvYTIJquqTZCieRC1jRka1qp3hBUuwEyYJL
	hjetTsPq7XF47nRBQRu0tVcn3E5yr3rBuqLygvX253Wys3cEB4RumZJduZWZ5NT1Ccz6i5KjutB
	xTJ8/+QEN5M9BcUIHMjZdyfvajhtARyrdqRROvQZAr9mxkBvczJ2D4sGOvRYbwZihQE2fGrWgKR
	co5QXu8aIZZ0SxHqmfHEDH1eIBYnES2AiajYs/0efB+0hDjm737es5i5n366wW4s5iEfyfTh7DB
	KACHEW0qtMbCOPDvYEONyzlHWz0SjsyQipW/tXeG/UZ24XdamNc/q6ADRZq1fXnYXX09QwdM2Zc
	Xh6s3n7Flr/HG+yZDGX43o6gJlqK4WcNhdO5U/gjLZwVgpUMCTehyGt+gw==
X-Received: by 2002:a05:620a:7084:b0:947:9060:7efb with SMTP id af79cd13be357-94999574d09mr635823285a.18.1795031671725;
        Wed, 18 Nov 2026 11:54:31 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7475b8sm257960785a.18.2026.11.18.11.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:54:31 -0800 (PST)
Message-ID: <c7f0c78a-47c1-4dfb-bf21-808e25f05611@gmail.com>
Date: Wed, 18 Nov 2026 11:54:28 -0800
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
Subject: Re: [PATCH 6.18 0000/2151] 6.18.65-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261118150121.603863898@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261118150121.603863898@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 06:28, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.65 release.
> There are 2151 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 20 Nov 2026 14:55:45 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.65-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

perf fails to build with:

util/annotate-data.c: In function 'global_var__collect':
util/annotate-data.c:765:30: warning: implicit declaration of function 
'die_get_type_die'; did you mean 'die_get_typename'? 
[-Wimplicit-function-declaration]
   765 |                         if (!die_get_type_die(dwarf, 
pos->die_off, pos->die_tag,
       |                              ^~~~~~~~~~~~~~~~
       |                              die_get_typename
util/annotate-data.c:765:71: error: 'struct die_var_type' has no member 
named 'die_tag'
   765 |                         if (!die_get_type_die(dwarf, 
pos->die_off, pos->die_tag,
       | 
       ^~
util/annotate-data.c:766:50: error: 'struct die_var_type' has no member 
named 'from_alt'
   766 |                                               pos->from_alt, 
&type_die))
       |                                                  ^~
util/annotate-data.c:777:44: error: 'struct die_var_type' has no member 
named 'from_alt'
   777 |                                         pos->from_alt);
       |                                            ^~
util/annotate-data.c: In function 'get_global_var_type':
util/annotate-data.c:835:26: warning: implicit declaration of function 
'die_same_file' [-Wimplicit-function-declaration]
   835 |                         !die_same_file(cu_die, type_die));
       |                          ^~~~~~~~~~~~~
util/annotate-data.c: In function 'update_var_state':
util/annotate-data.c:873:42: error: 'struct die_var_type' has no member 
named 'die_tag'
   873 |                                       var->die_tag, 
var->from_alt, &mem_die))
       |                                          ^~
util/annotate-data.c:873:56: error: 'struct die_var_type' has no member 
named 'from_alt'
   873 |                                       var->die_tag, 
var->from_alt, &mem_die))
       |                                                        ^~

-- 
Florian
