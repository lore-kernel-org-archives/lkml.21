Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031956;
	b=pM20o575hTr2EUNxwCUxwxL5/BRktJEBzzYoUMRePUiIjxnLuiWMVFp3hrTfiEOfPw4V
	 VG+V5GtbzioizycNLBmasDt7m25g6Aq/1jJIr/WOPRlw46qWZLJvfrycKuNojyWFNW9S9
	 NjrNNaGNnt4/Liz2mnXbiAr9agimEYEs0tXFI+q2UpJBofPNE0c1ggRATrSCjmTJDh72B
	 VmpCoB+W6Y7vXeA15YgTjId06ZfGcG9h/qitoC/Gz+e5TEiL/enQL++qEoZwtdaiAXb7A
	 PJAqeUyKtZtQBuMtuyTAPcdoTDfHdkVwYY2LwVboUDSuGOd5Oh210seyt/sDnYE7Xmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EvNm36ee6QMlzT0gTHiv5nNg/UkjSVqUWtytJ7TE48o=;
	b=EOtvmrHxf7g310qI5o9axt3ORzNfNcFBV+3bdqcPENw0+RSeLMbJMWB+xEw7prdxGeCl
	 AxHjC7b1Q40AoAnHD0LBDkR1udgE+cuIMb8F1E1TeIMUs1t5ptB+d8XNvfRgeT+NtEb41
	 YvUouQ2bnyEm8PZ5FLgLI2G9ViZNn/0+0d1t3w9t32P7w5E9v419KzYEUvbPqguSHvd8G
	 Lr9Ekxnud9xtEfa4oyRJ8EnmrCTn44Bz8cW+j1waGGfXokHkgF7OyH5nEhAWmOLlBXBGT
	 cef5h4+a+ehcORrummO+Fsu5GSS78bW/b79Cd+3eFsI91vvvrUW87bQBZ40MBmQ2Gow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YIkEaTpt;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898F4606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 898F4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YIkEaTpt
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3712b6d9843so1627561eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795031956; x=1795636756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvNm36ee6QMlzT0gTHiv5nNg/UkjSVqUWtytJ7TE48o=;
        b=YIkEaTpt/23/K5+TQfElnCS7kgWm71Vbi1ImwCIs1IFJFDkhPtL30VzXEUHDGhMy1Y
         eUBW2y1XoFqvUUslvLCEP6vVIC5BYJ3Dc5uiUo4E20cyFGTPvT6BGzk7W7S9cXHh0hY1
         gQ+Mlvk8tzfZELL5NmwimPM1cCD2RqpdYhj7jYlaaBD1TEyoDu9KWrsjbbnw2dxYRDBS
         lWfnzlk+GrGN7iKct00XaXa92OXqnw5JgyerOae7DUatHl+dM2dAtP7ulnOXyNfZAd4Z
         8uvQsjnc3QdYFzbsGNqLbfLYyPQvR3KHYiVOvFc3Ns1OztGKsOH2uGQDD/vADA5mRtu2
         2kWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031956; x=1795636756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvNm36ee6QMlzT0gTHiv5nNg/UkjSVqUWtytJ7TE48o=;
        b=GYTstwi+7cHu6QonmYCy8WNwHi1FnRpLelQuu8G02K20wTomKRpTQO7+wARMXv9pk6
         5GaJZmCI9lbDHn9mN2lQvgQO0Jon5vw7/ot1m9+sYUsyM4ub1t2LdZ60Ipmlkqh0raFu
         n+rRa1otL1u3C1VU8QguLd/Ve44P3t9nR0ZV4BJb4mLN5UCrGYPrAmnv+JnVrRmlF59R
         +V8eVoWGj5fl3OBP8phDQQw5x3Gm8vSkyBWrnXMLMSxgXch8Lb5170/LRUbZn1NzkHC+
         2gMqHezwYSlnyJk9moeUAhEJzZnMPWgRy8fT0mQemLaf8LpStV7WXxf8krB6Xn+sl9wn
         HQ/Q==
X-Forwarded-Encrypted: i=1; AL+hErELXXxRJho0pw8p4ZCKvOe3EG4j39XUbHLnf0fEyMTGGGWSIfoQAua3JpAQk0+YSykeLXG6MbrBr7pv7Ak=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XOeCNczj5pc8+ybc2zpwIWPWWT33NB9+PiUGl5YreOBWIsKXw
	eEh/sBO6ybnrffCf3H0wkPkKndtJaQHNuUti6ZT4js2zX/mQ03XOlJzU
X-Gm-Gg: AZFdTZfk1E+lZYFxy+ee1EU5xKqMQYqAtsLhYmOgCjdA5X1X8dvLhyFJcMpp2nDtF2j
	rbVjJolswGoNOZPr3q3GqmSBqRjw9ZhDQE1eZX/74MjqWi9ilI/b0K9KCpMvNnu4DsYqWYRIo+f
	XuJQ+kXvkuTSp2qE8TssJxpYiCEdSSSSSOXSBC5QN2BogZbwRwynTnmrO9EczapztrDX2kcPF94
	txMPsnbGPTu9/Z/yIWkLJo1q7mHqMc6WS7nOq6UJjE0M+8tzBEh+q9z3Aql4PgwF4Gr8nXA3PpB
	cvKxQdyqTWwA6mhbnz2cP+Ajk0cTkj03kMUJUw0PR/AjncAQ3r1x5D6sH0GaEXd9MrxaGPo9bFY
	CVHEe755GekrE6kSwK6uwqHPSbl31BytVzRtgOUen0vvO6p5Wj5jnbJ7g1Klt5ZcVXWUsJb/X8b
	55JK8N6yc4m49vKYWcyF3RvID6I9pfVUqCA+HoOXuv0WDYvJpj/0YaDV/J5/L4hcHYSvHvMu5DB
	mJUNLW0VlMD2+1eoqoQcewawf2+9aW8Q4tfGiClVr53rJ+d0Kmlb29EMq0xsObavUeezaNlfsrh
	Ya6yMP2L1+rgIqRZQ89eHDxzvowYglzC/qJfJfNa0LAA3eUuY/cUiS2AVpFe9m218Xf4KU1FxkW
	XvQ==
X-Received: by 2002:a05:693c:885a:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-3828161ae29mr3343574eec.31.1795031955504;
        Wed, 18 Nov 2026 11:59:15 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800366sm9938909eec.12.2026.11.18.11.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:59:14 -0800 (PST)
Message-ID: <835e4c45-4b46-4d1b-a2d2-de1147666842@gmail.com>
Date: Wed, 18 Nov 2026 11:59:13 -0800
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
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261118150247.972732815@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261118150247.972732815@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 06:20, Greg Kroah-Hartman wrote:
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

perf fails to build with:

util/annotate-data.c: In function 'global_var__collect':
util/annotate-data.c:785:30: warning: implicit declaration of function 
'die_get_type_die'; did you mean 'die_get_typename'? 
[-Wimplicit-function-declaration]
   785 |                         if (!die_get_type_die(dwarf, 
pos->die_off, pos->die_tag,
       |                              ^~~~~~~~~~~~~~~~
       |                              die_get_typename
util/annotate-data.c:785:71: error: 'struct die_var_type' has no member 
named 'die_tag'
   785 |                         if (!die_get_type_die(dwarf, 
pos->die_off, pos->die_tag,
       | 
       ^~
util/annotate-data.c:786:50: error: 'struct die_var_type' has no member 
named 'from_alt'
   786 |                                               pos->from_alt, 
&type_die))
       |                                                  ^~
util/annotate-data.c:792:44: error: 'struct die_var_type' has no member 
named 'from_alt'
   792 |                                         pos->from_alt);
       |                                            ^~
util/annotate-data.c: In function 'get_global_var_type':
util/annotate-data.c:849:26: warning: implicit declaration of function 
'die_same_file' [-Wimplicit-function-declaration]
   849 |                         !die_same_file(cu_die, type_die));
       |                          ^~~~~~~~~~~~~
util/annotate-data.c: In function 'update_var_state':
util/annotate-data.c:905:42: error: 'struct die_var_type' has no member 
named 'die_tag'
   905 |                                       var->die_tag, 
var->from_alt, &mem_die))
       |                                          ^~
util/annotate-data.c:905:56: error: 'struct die_var_type' has no member 
named 'from_alt'
   905 |                                       var->die_tag, 
var->from_alt, &mem_die))
       |                                                        ^~

-- 
Florian
