Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551249;
	b=EI62A4MOrCtLso5SvL2v9ndT2NNeuKqedBbWmbjDwR/Gv50urUNb3KIkpDrJ7hE0FeOl
	 vf/8P6bOVJVrpI4cQjhF5iWxR58h4J38sU/Gl1I0YpQ7vxnQg6wGSaoiNQ7KcFs/YfbL7
	 xjpFc8mnGKzReRdCmWqrygpukgEpP/BV+pAoeVcD3bC0EP6AeU8q4q1/2C70Oalq8+yY/
	 ZofMEXYfin/8EITqhCwoasLYhqShCKc9NzMt56eSqHD9xFsA+Ohhnf2/+ZfWJp1Nj0BNh
	 EVoIrt8wXpOD9J0g5eqC1JVRbtSVIbCEEAVR1hU5tt2MkhHAcaJokz4eCRpckzp4dTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551249;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=mltBfVBmYiliDdY8G4ZXN8O5/4Tt3NMy78VDvngDTpk=;
	b=uh3GJNAIPXByVzwED60Ls9SFI2Vuv5CDDQ5egXqL8PKa3L3OAom2vjZ57NK3Sk6sXwJ1
	 upUlEkI63Y+mAy2P8Oi9ynUvl5MI6rLJsMXTRkacYS81Ux+ronjhvcvb2fkVo2Holot64
	 LXpxSeVBCvNjr0k2CnYcTjrhHo6ulUixW8scMfzLVzx7RdWSzQTfzzgunRQuRHS/ddRwR
	 dq379WnsseLwoStMIGjDjhDoVQYGV+Zt/ZmMONYRE/gJgmRJAw+3kqQxv4uViYFQ8GMGD
	 CNIZDh8odLtE0QVY/+gwc4AFYo2CGoA2gG5o+v148qcqt/fOYcWy9Y1cm7MvRyg575Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aul54bK2;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BBA60A2601
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35BBA60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aul54bK2
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-94961bfe1a0so326326285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551248; x=1796156048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mltBfVBmYiliDdY8G4ZXN8O5/4Tt3NMy78VDvngDTpk=;
        b=A23F/M7lhUf2P3Makn3zQ2WCv48BP9dSSw480Z1VE1j6BHfIvoPiucW8ufBqCrfhAf
         sOIhryeGg0NuyMV/4bnDmRZON94z50nFm5lOouDqpib+XvjlwHGVaRnMUYLmerJWke+u
         qfXyCpfgB6c80LVcct0kS55MRgeZfGJCiBxhULOsKL7EW5BTSVdOoX6urRDJh9d5/J1b
         /LqjA8oZO/j5HFhKWaXxiUyD5WpD0Rc36Vq5RqtI1GGEWx4yjp3Pb4/vwr+XbHYSDwA7
         NBYkGAvOyCTG7QAFeI5C+Mrano1t5CEJ/MMQo4dgIltbulzl3FGi4JUHi0eVj/VrmlER
         ighQ==
X-Forwarded-Encrypted: i=1; AL+hErE2DA9dfPd59C7VwQfv1XSpUVWV5OaFxkoc8Cp1kz7u75g+qt0E3Yh51AxCGhh2T3DoOHAoytjZ9fx0GLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Cey1hdaczCFnvVQLcQ6DTW/OI1W63tiue6v35/Q/7YNB52Fu6
	8BGosKXuQlWEa6o2pBEWBSjyvpibJWm2wI+lQcuNnJ2QsDUEmZ25rFvbWE/r0OjpvV/vd2FMIyh
	rbvcFG1F0lahQEl0/7gPZCExc0ACPIs5t6+C09s3nnYcxN1pArCsHyoJOO3xczf7zEQf3ASkIVu
	aNMnoH6I9XGCLahGks2cGNqJSRbLI0kj2NZGaGx5xOHrmMByhDB5+LUYDjsOETQGE/a9NrET/RZ
	wz4QMzd/Fp6zthQOZzAwuuGvw==
X-Gm-Gg: AZFdTZeSoByfvj6+jFJyHrAwFahpdc/0yohS5leFyU0+5nX6IgpOS3EO2a0If1Jn3X3
	tuZ3A0VooG0vQhZfXmA8sASThTmJmwHjVKEfNgwdT/+ftvfnPeab/N4AkQ5m3jHf+KyjHlzPG33
	dTbu1u2rXOzjR6BTDuEgDaxw6sNwcr4n0wTydS2CaPPHCJ89LjhCo6pdVZK1pEz1zxjc1kFl1GR
	GsJPXgNoHCFpZfjbM0Rhyl/8GIF4OpXHqzfQ/dw2hRbd/zWDvZbGkYPRKqJygAwsMFs4x/c1Oil
	UN9zat+PcRUeUc0oIUaBK2lOb8a0JIIIntabOyIVkYFFRUWEKyY42W/6Q5CuBA3dFYrDgi+FOj7
	T29ZkwtegLNTrW7CJvbYi3kO3nQcjfNMbA3ASOvJo0XCvHjPV3ly1EGu1uNUSi3gsBtFIFZk9CN
	2fBrimPMEUSgNCVi3Nvnk1jk9L+ZPveqN2knKd9iI=
X-Received: by 2002:a05:620a:6c8b:b0:949:6193:acc2 with SMTP id af79cd13be357-949bab68a83mr2489771085a.69.1795551247751;
        Tue, 24 Nov 2026 12:14:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb0185cfsm111843285a.1.2026.11.24.12.14.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d2c49c3d9so67259561cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551246; x=1796156046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mltBfVBmYiliDdY8G4ZXN8O5/4Tt3NMy78VDvngDTpk=;
        b=aul54bK2OLJItCpGlEWsTxaea43hgxbNGfFzr61cNV51ccuyxWS9pwY9HfRO0vBhGE
         7sq/waUzW6k9wWufv+HSBq3XtY/H8KpBXUvrXPmS2QmCRqSznfELjs7NWtfRErcDgF2l
         UpCcoE2ol0vcWnB4euAQpeXJ4aTQTltCdBexw=
X-Forwarded-Encrypted: i=1; AL+hErEOZ9SEfrRq+YffHyBGUSJE6LsstCt0ObxcAPXZ4YuLaIBV62kuFTHZ6/zq7FvPhPbILj4Er+cAxxpJgnU=@vger.kernel.org
X-Received: by 2002:ac8:59d4:0:b0:533:3af3:43b9 with SMTP id d75a77b69052e-55d76a1c9a7mr301697091cf.44.1795551246159;
        Tue, 24 Nov 2026 12:14:06 -0800 (PST)
X-Received: by 2002:ac8:59d4:0:b0:533:3af3:43b9 with SMTP id d75a77b69052e-55d76a1c9a7mr301696581cf.44.1795551245711;
        Tue, 24 Nov 2026 12:14:05 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:05 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 1/7] wifi: brcmsmac: embed bandstate arrays instead of separate allocation
Date: Tue, 24 Nov 2026 21:13:56 +0100
Message-ID: <20261124201402.3499613-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-2-rosenp@gmail.com>
References: <20261111042554.232998-2-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 10 Nov 2026 20:25:48 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> Replace the separately allocated per-band state (struct brcms_band in
> brcms_c_info and struct brcms_hw_band in brcms_hardware) with directly
> embedded fixed-size arrays. This removes the manual pointer arithmetic,
> two kzalloc()/kfree() pairs and their OOM error paths.
>
> MAXBANDS is 2, so the embedded arrays are small.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmsmac/channel.c     |  8 +-
>  .../broadcom/brcm80211/brcmsmac/mac80211_if.c |  4 +-
>  .../broadcom/brcm80211/brcmsmac/main.c        | 82 ++++++-------------
>  .../broadcom/brcm80211/brcmsmac/main.h        |  4 +-
>  .../broadcom/brcm80211/brcmsmac/stf.c         | 22 ++---
>  5 files changed, 44 insertions(+), 76 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
