Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.242
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795663864;
	b=qA39ljNqang1IKX9gMiThiz/4HxWG+BZRivM+vd7YaoYLrx7cnX/4/TkzIqaf6vLSNII
	 hfffCoUs700gWHjscRunEOqQb33NckTCY6DCWi8XjIwmLQKHFxFZMq5lSLnWEU+CXHN2U
	 B8kQ4Bja/gvwqhWMOtqZ+xNOQET17mHnIQLUfCiWol+r7gkvUeH7nlLsYvmaAKn8Uqp3S
	 69UHFKk9mhsg4KCt/DDEPainHmaffWTp4XwhZ7UKTe6FKz69bKyEPotfkmvXHXIiBeHFd
	 oguWnl6iaD2KMDiak4QEq24rP0Z3VKLI+lVgYqi1B+UFW6U5XiijYYrkSObskxOA1Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:X-Orig-IP:
	 X-Proofpoint-Spam-Details;
	bh=N+P3dYoO5kNdjktkieB+BYanGibwmSgEVeuarspyJBc=;
	b=nm9PYbk/H9khuV+b/J8aaN0fAYH4VNP4A3+dZimSNgp3/1QvbPEyUK048u6vXE8Q9SVc
	 mSAFjxCs3Ls2HqYvOlw2x97gvk83sX0Kcc1kb84IKrT0ZcGcjV3RTq9cYyxHUB2+RnOOa
	 auTALok3+qXfEAV2x87JEJvlcQhgQDO0cmRr59BhFQxui42cF3IJATiIm1Snw28K6kHLK
	 LnLk+qstB3KSJA1WCONj/BOVQ/TP+eH0rpJAIdBUgHdGwiSIjMNwlnbsTBHQEJfgl0BRY
	 3AFrVKGvD+HiyVHE58mQ8txTEMFQ/OCKbemZ/eQ0DZMm7Ifduu2YJJChY/0oQ2z9Vxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nyu.edu;
	spf=pass smtp.mailfrom=nyu.edu;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=COd8mw49;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=JiuSLZDI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.242
Received: from mx0b-00256a01.pphosted.com (mx0b-00256a01.pphosted.com [67.231.153.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5545E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5545E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=COd8mw49;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=JiuSLZDI
Received: from pps.filterd (m0119691.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ25css1342464
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=20180315; bh=N
	+P3dYoO5kNdjktkieB+BYanGibwmSgEVeuarspyJBc=; b=COd8mw49C9yb8fluf
	eIy7xKCBDO2NqfQ6VAl1RZHBzlf3A8FWyBtI3QxWFYNXNWK75UJvvtc7WdlZ1IzN
	ER90msZ/mgmPX13hDztWwhQhgTZAaeDPxvEGwJ5v6lcUUP7NQoNQ10EMIznCVmWn
	LyC7TFQf6f+c6Gf8fjBcklYPSlrNRmr0kGQYalOnkV6wCDxAZO75UbPrcv24KW1D
	fGJurblv5FqeYMvRTWR++vxeUGMg3UkbZIovuagYiuGAzqaMCE4+8wRcoF2yLRaN
	ocn7fTwSIEMocOHL9pSTNoaoB5kEeXupx5YwAHVqcXLhow01S2zYSYc01cIrZ7im
	+jwHg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4j66kamvdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:31:03 -0500 (EST)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386c3309469so2496803eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:31:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795663862; cv=none;
        d=google.com; s=arc-20260327;
        b=rwdJ/YnykFbmTvnUxNRTQZrROy/3rRgCGYmJRnkt9JH/ysElvxxkNsdhw+CSVMpuuF
         eFeEqAvQ5bo6SR2fJNSojJAXYTrm4mVGDHmPXrIjHO4JHCXSyM2Ev5nPeVtRs6dzt3UU
         H9Zr8dYMqryUdpj0piBTDRGO0NbQwRXJ7ew/Mydwk42dGHoOg8p/FxqDYBOhqb/WwWwS
         86UOEuS2J9EsqkjtFnPbsGB17zqlV1B+q4Q9/Ql9xZcgQvFu0a93eAJylBfIuRfvwZCY
         jXrzUhgNMDbsobK0EA306Yx9e21GwvRW4a9PqYnIUQxRND/P4beYvB1w3yN8LMMGp5Ny
         aBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N+P3dYoO5kNdjktkieB+BYanGibwmSgEVeuarspyJBc=;
        fh=9Wwd1IJJRmF29hmO2mStaosowvKyWeXiub/FV1EMNvo=;
        b=geFfwIPkoC8XNvv15seG4EYXC40QeFMs/pRVQ56qJb5BLW2Wlk6+yDDOprO66v85mz
         vKEotwLTSf3boM2+IC6M/D5t/xeuFFMrx1y2LOloxpCq6Lrhwkc6AC7ycaavhPSdAZKl
         5vA87rc+EMU3dBQ1WGT3XdJHiu4zOPF6cWTz2okFPTp4RSMNcWv+HiJPpl893DdawCZU
         WwgQ7Kmo5k+z18G1mJwAaWkrsVJZLN3oVZxXFrHrLOa4L+vAy4Iit+J/dheDFEFymDOZ
         1V/qWVGt1JAw1JsVPbPSvcmZqHvF69+kufLuQXVNA+s4+T478KkDM3FrDysppIjGqAjs
         2cIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1795663862; x=1796268662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+P3dYoO5kNdjktkieB+BYanGibwmSgEVeuarspyJBc=;
        b=JiuSLZDImeXzsqgLNJRNnubrt/KHtLo+zGC+u700XKldyjRDyaauQv0cvlJ6SWaBKn
         q9y5vmDFMZQDa5P6gqtCrGhtvTxcUl/yUTYSPwnq7zZJEK5BBElpXeoKok4F/Ks/Sa5E
         7wN5aOOrALqravaHGYmt8TFat99+3aML3njfkzmcmxMaMHneCmQUagYp7xrkw9DRZf3L
         BUwINFVvQjIblpglMLi+yxVgWfE2ICRIW6bOvG2l3hDzUjD3Lc2Il18ndBxHWglpBZnL
         sSo2MewM7TRYrhPigOUejjzpzDKEH6oj3dSxG+KGaLIJxpGWpUGDQAL/5QIdBlkrEja4
         M8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795663862; x=1796268662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+P3dYoO5kNdjktkieB+BYanGibwmSgEVeuarspyJBc=;
        b=nRVAjjBNaWjhOU2CqRV+7bbvEdxu6vQuoacks6eHIzUeNULdRZQqynwcuTgAudLsZy
         z8K1paGzOlXfqkPGT3EWtE5aCzxy7Wkf24/NQK3rE4YRWi5CI8Af1zXP6J1q+zKkDIMS
         saCLjeAsEQdy+JiLsIVdlY4v95eY/I+1pCx9j+xLuLDO2yZ5+XpDVWZYjlbtTDnniKil
         Y5OnD2oxrdSac6THmoxEYkviQoxbioXEaRL8qRcu6R76q2cq6fdkQPOn+wlk211YwH7L
         1KYbSzPIvYml/7zG6DG2Tv+CSMHC39JaRA7+pm+YbS1sXOo7laDX8Zns2S75eLhBFXCq
         Onmg==
X-Forwarded-Encrypted: i=1; AL+hErHFyVIINnOr6M75k2Un1VLK/3PzKGRNywFyvH/vWCcOryTsXKxGfSC9DAdei/I2r5d9/lYP0nz2fYhfu00=@vger.kernel.org
X-Gm-Message-State: APuU4Z/at3IIeyeEM+t7b0CD+oiosWDJYfwRlM0bIFgAyi3bE9Sl27Zz
	7AX28hwdEAGW+/p42/pcP2OiaJVa92GHGHu+4x5QLH6H6CZXgOy6tx9+QJ4F49bU5EuLEP7UWn6
	F9yAXsL0G2E+cz8n+4F1mcQNbaOuTlPF/8cmRr2bYaN3yqroxTP+zKNhCXVKXJrkyRkdxkXvMnw
	VV8/l6FeX4TSEM3Qwikgg3rWcaP7aahNP43JlI3w==
X-Gm-Gg: AZFdTZcMVAfHurAAvqNgAkYZSuwg1H29Gyeaai3w8SLm/8/bUu04IDOdbFOERzGP5IP
	4+QA40YFS0vKvC6ADZppJqxZmJVK98nAO/0M2CUXaFMQ+N0rLzH57+dxwMS9WhQc4Ziz7QWxDBh
	kQ1wqwasv4KqBHS7LWCoa+NhFtL98umKjvs+Ey8jFPkLl4TOLYSNfEYup8KA==
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr23198235eec.14.1795663861908;
        Wed, 25 Nov 2026 19:31:01 -0800 (PST)
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id
 5a478bee46e88-3856fb6a672mr23198198eec.14.1795663861013; Wed, 25 Nov 2026
 19:31:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123050440.223436-2-kj2864@nyu.edu> <20261124113412.2078323-1-amarkuze@redhat.com>
In-Reply-To: <20261124113412.2078323-1-amarkuze@redhat.com>
From: Jerry Jiang <kj2864@nyu.edu>
Date: Wed, 25 Nov 2026 22:30:49 -0500
X-Gm-Features: Aa3M54o04nhg0P2_1uYOfzaZLCGV6LCP0jYuR67VeYdioWcby2Gl3ug3k86xqRo
Message-ID: <CAPqbLS0EbbsQ6Z8P_vep-nMfDKbe8S9cKiOS5fWp8qQdFTp_eA@mail.gmail.com>
Subject: Re: [PATCH v3] ceph: Use unsigned types for snapshot split counts
To: Alex Markuze <amarkuze@redhat.com>
Cc: Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubo.li@clyso.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>, ceph-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        co+408fcc361565713f@bugs.sh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Mcb5KJ/f c=1 sm=1 tr=0 ts=6b07a7f7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Se5WoFf3ZZRiLcel0nel:22 a=tr4woWNwjDflhTIOjkZU:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=GzGT0hU59dN0ITKBXqQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 7jnbp8r5M_SY126cX1E3gTvH83HKccGs
X-Proofpoint-ORIG-GUID: 7jnbp8r5M_SY126cX1E3gTvH83HKccGs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxMiBTYWx0ZWRfX4be9wDPwqFlR
 icWcmnnWu9gDjeSlCa2aYoDPeL8Fz9iGth2o0AmR9Utif8b9NTj+yqyJl4pjQEFi19TXJzVNFtm
 LC8U4WMGEzAGvX14RgC0VsF4SI3drpPqXMIbZPbgkgexEfT1JIpyGgqW2EErNX8KRv5jjmJ6ZBo
 p048Ue0MkrcFx0E5x5n0qCb6Kg9qp56fzGGwHrTlGR0PZX/F4TTM/kQOpZ/LL9EQVrMswiLqaE7
 oQXWocRmuTq2GLUgxNSX78txfXgVZO5l4AUonxbj4w4ekSoFEHhU4YeTjyMhDtUWMsOcq/GL3ku
 y0xCGIqxt2lD+rAEe0dZ8zqnTTZepbP/qU4vOPEH910kx2DkB3jXCPbfg4G0RVAhW1R4tOebdXf
 K6p2ZUha34uprxPj99dhbheAqXWg+G+H5YpA2HArF587VhQjKELvW4gHXU3qW+QHLKvZ6kMTooE
 EOjiRIOXGcIZ+N9TB8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxMiBTYWx0ZWRfX+RKA0r7EhBBw
 Kem+UOnzIfR8GHuJxHZqT5lnZU43+uCZzzIK8pXBu/EFA1Q5pWbgXHPGt8GXB7IVh6fE6ki0peP
 PWWifLUbW3yMktiHJFtej+C1UUmzdU4=
X-Orig-IP: 74.125.82.200
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260012

Hi Alex,

I've looked through your request and created a new patch for it.
Please tell me if any issues arise or any other changes I need to
make.

v4 has been proposed:
https://lore.kernel.org/all/20261126032756.265377-2-kj2864@nyu.edu/

On Tue, Nov 24, 2026 at 6:34=E2=80=AFAM Alex Markuze <amarkuze@redhat.com> =
wrote:
>
> Hi Kaho,
>
> On a malformed SPLIT, the failure path calls ceph_monc_blocklist_add()
> with snap_rwsem held. If the blocklist command succeeds but the subsequen=
t
> OSD map version or map does not arrive, cached snapshot lookups can remai=
n
> blocked on that lock.
>
> After the blocklist call returns, ceph_mdsc_close_sessions() can queue a
> close request and wait for it from the MDS connection worker that is
> running this handler. The worker cannot send the request or process its
> reply until the handler returns, so with mount_timeout=3D0 the wait can b=
e
> indefinite.
>
> Please move the blocklist/map and session-close waits out of the MDS
> connection worker, and avoid holding snap_rwsem while waiting. Keep the
> client fenced, prevent further stale-context submissions and account for
> writes already on the wire before releasing session authority; retain the
> required references until the deferred cleanup finishes.
>
> Thanks,
> Alex
>
