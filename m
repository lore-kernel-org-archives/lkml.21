Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710971;
	b=i2y7QVIrzctZw1ksX2qS3zeYU09mkQm6zyvTolwTw6q9ZZbTUYxMMv62p4yTj8m/xCuG
	 3txLN44gJ+pO3wPMgA02Q09Vou1BwLZTNYk4CcniQ5o/kUWF9Rt34zAvlGO5Sj8s1aV53
	 IzFwj1LC3Hx49uMZM03fhuGLcELeSEs8vtieHJkK7DDPpjYE6o9RhqYTz5iG+Zkj8cZCU
	 CaLOJJalp/yWCLqOQC2RUdmyQ8AwPKRbX72j9L5iUtaAUwihytQ12ArccgoKGW/XW5XY1
	 ThwPr+kdx+gfKFk+I7RF09l3AjEe5ugbroESD8hDxl7AniV9qkOps7qe+hITo3Shr0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/V/q6vN01qyM55wT6FtlhrNcKv+AqGvLCJ3sSHicCRM=;
	b=qUhQtv4C8mycC5tyJ+qMTCuIVhl4WtZdgMldhw2hHqKFZrypdi5otJZ2ckUM4tRdv/7A
	 lHD2M6ktrAwE7Y6xPtxbsyCFolz4nm5hRAecYymXZ/KGJtcTxz/V0gS+M34CEPLmT1FHH
	 O661arf5rXrs08ry0HkeTKhgPzMnWnwgDayv75XkW6AxGE8DAy6A5nPp3hp48LgudNU7R
	 Xw5wW2CAlMAsm+IorJH7kHQwn5eyIsy6ke1w+eAQyQm8GdIW1BsX8FM4SVrq3wQDB2OvB
	 btziZ5/x9qrkZBxp4I4IWhRD+HSpRPRQaS+31IgavelBLdujOMLOMwPSI+KBGEMOKAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=jTqSgiI5;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99123606A68B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99123606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=jTqSgiI5
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so46930245e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795710969; x=1796315769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/V/q6vN01qyM55wT6FtlhrNcKv+AqGvLCJ3sSHicCRM=;
        b=jTqSgiI5rL1PLDfYRGEUYiTiZCRCnpYLJfz5etGQl5yGV1yeukXttQocy/Y8iDopJD
         fnmG6PtwwHfkUC/yYi7r36XV4E2835Ezpm1K28MBGCjY0ckav4wfPHOagynYcaMizArD
         jk4EOvN+ni6me6j8ENHTPC1NiPgg9LDYCEBEmlDtQXUq0QPm/FpmoXiJ23TPirhnMxPA
         woiDK59qSLg3cmCYziQgrEgMzbvYhakiA1w7SRWTFVqrdsvExfPfKOFkSopd/NBsuTm9
         1FhNgVOhPm56JD/yjhUPuBz6cAMLjRo/R8eL17Ga7OQ9tuKgyEwVas0vYv5PKaBCUbra
         vM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710969; x=1796315769;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/V/q6vN01qyM55wT6FtlhrNcKv+AqGvLCJ3sSHicCRM=;
        b=Dd8+iDCT55kyv+P9Mv8WWquEVcgaGD7uCS2ERa2yU+a5sbzEOj36d6q5UVvRkW3/bU
         li8IWsBV7YFi1VV77B3urI4VYvb9GLQces3Q++mTRkWcwaWbCVVTA+RcoHQF9CbIR8ns
         ASEqXZBCYI47qTY927vyXJOevJd80qxpyKreZ5sN2VpYFWopV0ACnFG2wXyKPVXYvv4k
         4DjJw+jjiSjzMStSyFSnDnJtfmhMpQhNPY/NT3ztbs+J8IkjNYURJYS4t4L6hetWVW+f
         0TnfXbVDtc01PHkH6Vv2RowyM1q6o/zLnLLq0UkuTA0fiC3jBefIc750Op+wsMQlFtcf
         EGiw==
X-Forwarded-Encrypted: i=1; AL+hErGPujS4m5qA/DBqi+rjj6LXDZdJjldJantNgYvncKB1Vd+C+j11qbbpwtKEAlAkWYWhMDjNd/0emOMzsv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z95j7n2rL73+z7nWTeCfnP6HLHDwr3p0nq8Ob75NtCjIB9eaWmR
	AhFxabgrXhiJGirBCPiEH7IKdd+uuFaVMogy9sl5wJfeRNQd5chgFQiBZ36m
X-Gm-Gg: AZFdTZcGZww1lBF27S9qAOJK0rc0v/Lr+WvArJdzHrPfagn0mMmoN0c96zJDvqlzArM
	u2/VFuGG9abHYkwbayTbxqvalsMoUJoXa+3UDocScE9h45yMYHXZVhhar53lyYWKAvMM5Udn61w
	pOCCeMqNq0uWxzehS3BK9h6BRPajntx5DxJzKZa9KHdzGWZniLzyy+FTM/tuZ9NsMcxQQMBdG5G
	rp22C+V442FC/siynaSPXwq+GFKy0t+hGa7NOQ+yuYGOF61gTLd1DfOkPK6QseN9psDQwkA4yj2
	TG+S5g93Xk54Gzll9bwXNay8s6bv2ImjkRjxqJoPkSTOsCTd37l+a7gvsX5uxRadVThbXXkRLcO
	LT3fiYg2Dd9Igevwlw9R1VsreKdBNVVRrtNnHNDVDVhDS58ecItDyNr2taKAOh4jWD4/pgR6yUI
	iVrxZfiJ7e2tyQLGzJslcw7x6qGTcZ/ExGnds+pWDHpKbqMEqIh5zeV28ipbMznOqu0qTv+RHZD
	M7hcAljUUotkY0vI8UEjfVRbVletkXoxfBx3HBkULFXUaGqM9jCQZfIUAQMuVJbzy7j/ltW6/qF
	rbbpf8uVs1fZBoTcBdv2JKsZxOxRIKuMvomd4oOOCKu/3BtYZl0rLUVmtYxUh9bIcrL1Jj6VCjt
	d5vSQ
X-Received: by 2002:a05:600c:64c7:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb887ffee2mr416755365e9.9.1795710968740;
        Thu, 26 Nov 2026 08:36:08 -0800 (PST)
Received: from [192.168.1.3] (p5b2ac210.dip0.t-ipconnect.de. [91.42.194.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm606032885e9.15.2026.11.26.08.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:36:08 -0800 (PST)
Message-ID: <2b097c77-6ffb-4463-b154-661f3731c412@googlemail.com>
Date: Thu, 26 Nov 2026 17:36:07 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.12 000/815] 6.12.120-rc2 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261126105709.009001842@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261126105709.009001842@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 26.11.2026 um 11:58 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.120 release.
> There are 815 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Just like rc1, rc2 builds, boots and works fine on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or 
regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
