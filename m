Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165891;
	b=zTLuPylflRYvthoMnvMpymAX6bhMa4K2cHmpTtC3kcmjlPkMH+OQ8XjUSutmxBZhQVrk
	 OR57Mvze7m5WSN7kWRaknLuGV3QpuufwvsoGmyS1qreeH+LtTWrWoO2wsZbAuMN0H/wYH
	 fa2sduPxe4PX8u21f+rRebVfc2MZh3hLyeMX0uO66Vqd27lsBCXVpekE3wx5BmGh7wC9r
	 uptIlBT7frbLylmw3h2o8ik3Jr+3LEfy4gIKd2Rtk+/Xqtvi/uisK5UMMkDA3BfA6Im5Y
	 ItA6oFnRFFrmhuLrIznAOnPdiGNJxUjJpRJpVf78YU8VMzcl892dRz6hfencGU5d/kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165891;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1hDM5Gf/IXJa8i5k1Mi9KOj6U1sOYmnGLsASV4Hj194=;
	b=D9RCL1tkiFLJbGAhugl0fKySES9WRIselqvoylBzEfPwSxI5OAnrKm8C6gPxArWbh2bL
	 9kcDyjWFzkWsQ16afz8fPin0vswAGZ02Nrp/0zOmBmZH7Sq/ZDh2gWIflIG6V+Jq0V6Gd
	 eefTmIzg0Agqb2acr4/4UcBAgqonLDpFH6M/XCOq3bLJ4U7yplijNjaA5Eunin7QEkGLG
	 CgeTcHgzsin16lfmzotLcId5+zK4HgQkDwQCLzR5DpXAsqReNc4bX4BGYqSX5pW+YgxxT
	 KB4ZKrivhEflnenUvO3RMC/S3VswqB8PEwNSeJRjxk1UD5bC1nn27sr/onftghs1/dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pobox.com;
	spf=pass smtp.mailfrom=pobox.com;
	dkim=pass header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b="dqxobL/W";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uKzOAofy;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723C4606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=dqxobL/W;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uKzOAofy
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9B9DF14001E5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:11:28 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-06.internal (MEProxy); Fri, 20 Nov 2026 04:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795165888;
	 x=1795252288; bh=1hDM5Gf/IXJa8i5k1Mi9KOj6U1sOYmnGLsASV4Hj194=; b=
	dqxobL/WnHKFh7gnWZvN4SNZEcXWLrZMgFN7YHOXskevaCCHIg9S3gNrUrHR+JoT
	u8iHBXapxjFCLi1ano+xH4JwR2zr7Y/cDoq4GR0oBfwjYAj0IeYkAemmvxKWevjj
	zfJCITg7demHbFgfmatA5LMwkJ3ymyUJXIlBx4WTbm3QOhkStawWJPp+1alxMNXZ
	JdKzNTorYtO1rkbbUkDdZya+Rym0GNXOfwb47R7iJFNKA9zjhqCOD8vYPey5XirF
	DAn7PegnxExbWSGyldh2qN3npGxeed3SZwNNEFzxBxh5iIEs+jK00Kvd49J4hNiP
	6aRC2Pqg/XKtd8eM/vKzOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795165888; x=
	1795252288; bh=1hDM5Gf/IXJa8i5k1Mi9KOj6U1sOYmnGLsASV4Hj194=; b=u
	KzOAofyBPOf8iNbhZTDZpN0+wLQOWLdtZhkV5OeZufgt4yQb+XJCtnnUozsJiIey
	TLSbXyyqlrdZgdUuR5ags/XNP55lS/RXWlxNkKC6HJpMnSQBXAYq+McB3AvR69Xp
	SvIlDoZOe78rdiliKvn8qy1LcNehJH+3GSWGttqkpP7wUbkxqfByFUbykVRigsFJ
	FTch/bnrPdkji9UUmK0eQFIjaOaPJDer2iinQzausWjSP6xHYhHYh9ibo9ez8UeU
	OX0cY2l2vsJ2x6zd6Wk1qt/i7qB34FU1ZzBPWCDHeVz9GjDu5L3a9mfurVC8VscZ
	d63FsHjjd9EKLZLx/Q9pg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795165888; d=pobox.com;
	mf=PGJhcnJ5bkBwb2JveC5jb20+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:BIVXhaXaWVs0RfL5rUd/DfHNkijyZFAQNyuZtYecSoYAjiX
	TcYxYBgAgynNd+iIC4m5klzQGsWL3pBz1yE0ebl+Ce2fWtnHCwvkBENhKTxmMlXx
	wzXzw1M4+B8AaqmwHpQmTZNBRn7pTmEoCNbmfbATpb+fmrmcZ4UnOHEZG9vN+ZY/
	CejYe+zyF4xrLXRcIfHnFiVg72BXKBJBpL/7z8NrRqqbyyOhpD2Ynet3jDH+5pQQ
	fX06pVkw/9/EyQrR+ui35Yn2HFrRIWhCqby6YVDRaEWI1bssqoBmxrHG6gXTFkuU
	y7ZJG6Yfz3a8YgdXhH/CdcSCEKvD93Kw+VMStMw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:p0uCjz5jaHPCxCefuOz6KQZU4plYYEHSxSQk7E6+bNw=:Jenh8YvvN9U4RjptxucH1k6+tJGpSw1CcgOdGUkHli4=;
X-ME-Sender: <xms:vw4Aa2McEUxq_ewya4mt1rq182olCLlIRoGg52pPQdIPdQee7a13VA>
    <xme:vw4Aa1W8HJKUar1a2V6sHfn0SIDwgerNaJxvlf-HteV4QF-IB-BLa-6gKcVNt7FW3
    NUcOPr4I2zRC2L7SWpyWBhNc88nliOsdBZm_FDJkLIxTiCU03BG_4HP>
X-ME-Received: <xmr:vw4Aa-abhtoqtAi7GHfKp0z4qWcifbRQtV2oqYiQMFZz6CjweqocYVRtQx7Xxmk1wIoI3hn2L-pmNehfrpXfxo1UrTC4aLa0>
X-ME-Proxy-Cause: dmFkZTFcbiNj0kGpXP+YFUGPYwmWn+iYy8ELICUFrI8LD2H84eClBS2ScX+5laWZgbKqAi
    aOrixx2Jo+2gfFC2jo/gdVqJ1J9fKjBcenMF+RvSvTsuqEjP/oivGVGTmgydqosf3yCspu
    rzvBhE1PVGSLbGuknWj+WHh60UvADRM4Jk/ZmLNEojxN19x8vYK9x768l9C06/cFhJ0tXh
    s0I2K4KXIQlBdSwo7eq8F772Z842lM6vyjqB1+kwli9TUjJWojqtEmPbN1rbVb6VrHHKHG
    6d3ijnk0NI3xzc0nqjDoqqD/mZ2kykGCCXtCzQJp/WIwGrc9aNWwD4W+5vcIxojyBOyUqg
    T/q4HWt15m89cfYR9iyjBs6ge0Iz1TWub5Egir4q7Ph1MEB6wwhbn13Yxn60fIT+5LoxDG
    4uG3F911E8hDEzXzoRbxUeKIYk4hzv4dA6agdI0b5y1VnYMgqKOI9IWiTGKX6gNTv3vdSI
    /GbfM3NxtZvyfhvTRKQvY709mUKgwGLg2mlGEWCx/mbrNtm3KVJnT+vnc58JRiLsM+aMcB
    L7Gqy4gdmF4GO2PeWM6iEqGZFARtgxG/gTuulIpscPqadceyTJYzc7sdUhxCvkICKW5gAR
    hYWjJlrtbh6PbGwMgj9AiyNpmWTdgUMPcWlV59YghQqx5o1Y38EJe8CBIAyA
X-ME-Proxy: <xmx:vw4Aayu2OsXpyj5tYe4SJRM5WWNeyovF4F8Q07P8fJw9H6wy_CV2PQ>
    <xmx:vw4Aa9k2fY6UrcXeZgKwy0MSzkJTZ6ujEoPCdZX9BVqEw5yowMPmaw>
    <xmx:vw4AazX4XpPWqsyX_z6tXV2vjocf-B5EyBrCq75rrUl1HcHrUfiiyg>
    <xmx:vw4AawnqcB9EPfnKNa7WRFukG8RoxQCYOB5VDxoyONkjmISzn563og>
    <xmx:wA4Aa02DxH0MfqkzPSYegF0LZv714QEm97K53TSDPrmSI0qHCfkCDbB_>
Feedback-ID: i6289494f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 04:11:25 -0500 (EST)
Message-ID: <84c3376b-513f-4045-bfa1-db9c35e75200@pobox.com>
Date: Fri, 20 Nov 2026 01:11:24 -0800
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
Subject: Re: [PATCH 7.3 0000/2642] 7.3.6-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261120055248.913352689@linuxfoundation.org>
Content-Language: en-US
From: "Barry K. Nathan" <barryn@pobox.com>
In-Reply-To: <20261120055248.913352689@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 9:58 PM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.6 release.
> There are 2642 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 22 Nov 2026 05:44:39 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.6-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Tested on 2 amd64 systems and an arm64 virtual machine. Working well,
no regressions observed. (Thanks for fixing the build issue I had
with 7.3.6-rc1!)

Tested-by: Barry K. Nathan <barryn@pobox.com>

-- 
-Barry K. Nathan  <barryn@pobox.com>
