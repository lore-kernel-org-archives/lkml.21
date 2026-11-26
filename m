Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672870;
	b=n/WI/Xr3s8X9mCL9xokTKF6QpSyYn2Dx4gQ5tcjT5YjrjUBtH/AoATWU+STUqez4B83A
	 IAqVZN1SGgTikdRP6C36GqFaM0c+/N7vsVEqey2b1thkgcQzN/pfZlVmlAoWA8zF/ZbcJ
	 wgCg8I7eDetPMBttB5ChN2TgnwYcE1trk5GgCvMEEczk3gMhhHdJRA7eE0Rju6tSkuZD1
	 65u5JQ2DG+GdyTvL8KsceFBrJBjuC/BPHenKlqqXzt8BO+7nVT4S5Iii2bxp3sOjpZor7
	 q2yhslTdJxBlzVTcBCIn/4Ai0o6sGqIdBnajw7q6qhwyfTeprhz05m8ozlN/sug6iZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Adjp5RP4U0lbT5v6eOF7Mh/DtCyQZE5cE/uugkCDfqw=;
	b=Zng5HlZCY5SKD3XYGNBCIdlLbrQy4fsQ9SPOP7ZjP70+9mcPluzo0X/NHtxyuxS+EyJu
	 GjE+dFA5Yq0XCyCa0tj7wL9cXug9K8jyVIVyRQUgimWTE9f1lWILhmHRVpc6fu3cBEZ1m
	 l6l12IYOYMzxrsPS5ADAsetx9tOlyxh0a9amLM5VgjCVLZJ8XsDYNgrsa2w7A1s/JBQNL
	 BiCSSyFRS3H1w+jMhFNWuEDiqZP4Xjb9BNjuXgXQ4rekm5RTIkgQ/Z9TDTqElnmBhwMY2
	 8TTUdASl5D9/xWNy69mUOm/C1l0qLvTYHbAugCjDRT31dBpPvT+GfuJQepIFAi2DocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXE05y2A;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FCA606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54FCA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXE05y2A
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cddc597d062so3995584a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672870; x=1796277670; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Adjp5RP4U0lbT5v6eOF7Mh/DtCyQZE5cE/uugkCDfqw=;
        b=JXE05y2A22ceOlqJrz09kRtSlGnLeaiWQ3Ld44fRaHDZ8r1SyXki+OaBduDCzI6r5g
         LzwQo2Vw4ObgsAALNahfqcRjkxPNpUIG1rsjn04q/uy1OvtJ6Sw3ytBNEQNyp8uzg6lb
         lhEBiFqhvwWZwqbJxX486H6yvryFchtp9unS7MvQCC+OweZrwWgpDHRowYhpLEF5Fgn8
         RnIPV0Ypf4eD+MoPwJzuVuvsDVOE14S0f2QukiMX3BhpafM3HRtiSkDqJb+JYfd8MBzC
         6dcOWOCeN1TctXZe2EwAu62nTpAdfoKyyiE6omAdC9T8FktjxH625yOtS+5cySdEi29o
         3GZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672870; x=1796277670;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Adjp5RP4U0lbT5v6eOF7Mh/DtCyQZE5cE/uugkCDfqw=;
        b=k5AKibgWE9M/1uikkkqBYsPABn+lLnPcOgbvW//tqZaZtdi9EYom+6CETKUaDp9Ccb
         1KErqpchpqw9fB1WCYfwryXKFGBoM52lzrGYhubpQWZaHOCMTZrYxJ3vzm3BdfrVPdBF
         ZhlCG6tf5BpIXujAOKemXYtJeBdv15I9sF8/lPelZsIImfKfmINV2SwwfiiQa9jWPz7O
         R3whIWYmW0IHNu4R7mqxY+3nSyvG2zLArlmwKKs73oEWHYmMxZJCD+8iVpD32wsqnj4b
         BuchTeb7ptaePWnJ3pxvF/LF0XwdfkGddZyXXA5hkVeq4QZ0QFf4ay8tRg/Y6Zy5Vlmm
         tB2Q==
X-Forwarded-Encrypted: i=1; AL+hErGO5qRaIbOJo/OR8rjb0LlkwN+lkuYHUz7JXuKBUe6RCLxKfvLnW92NRZGSKKsiz6kdd/R3vCVohPe7xug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lmj3gE8oL8WKP3MXulIN2kwZffOKLdL6LoRCMGvFx6wTSy/eI
	tkT6q3W/7UDupeA/rxBb0We9n0Pe1Okz2BNR4U4u46yieb8O6Fj4O6wyPII2c9YK
X-Gm-Gg: AZFdTZe2wVm9F13GRBC2fxNklEsP0Y2hjYyR+rW2qvqV72HLm8Bl9eWrqoa7cUF6hn5
	TtUtPB/cAzRSspGnVJuztS9kQG8wb6i4YHvfqmud9a3oaqdehBkgNRoZFI5/dRdkoaMq8/Eh/WI
	wB7uji1S0vMrpXEgjC9MhInRC8UHwotXp4j1jlii1FmtxYVwQz/vJiRsWVFTrhrHx1GcJjfqY8e
	RJiQNEu53FAnLI4UtNi0Gzvnu1g6qed+8dz9oTqJwaLvF8JhaG4Q84rMUHypWGfEcQ7MBJJej/W
	Un2zCh4HK0ykkPOVvg8WegnWq1zzHBR79hITsLtGOo09rV+mPtbY04HCQ7GTVogxpkDQ80jVxBR
	ol4Y/CklgI8WDxzpMxzdCvmDOvCQS3K1ToxUbm/ZWJK0zkIESmjqG4iyVpPqXORawB9/9MyPEtJ
	uqWP97siuGezX1Z2Hufv4fSVjpYNLosH5z/ZrF21KFsxhVTCtK2LVpx/8LYOTSown6jQW0wiHhu
	s9sQrc6r8KNAdvnuOox6OPqjwD5AcQejAWU3ImULbl1Pr5N55rQdRJiqXvGBb434KQVy8A=
X-Received: by 2002:a17:90b:278c:b0:3b1:bdc8:c32b with SMTP id 98e67ed59e1d1-3b41c97ac78mr20450613a91.53.1795672869686;
        Wed, 25 Nov 2026 22:01:09 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm31531327a91.6.2026.11.25.22.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:01:09 -0800 (PST)
Date: Wed, 25 Nov 2026 22:01:09 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Ding Feng <dingf3ng@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 Ian Kent <raven@themaw.net>, Jeff Layton <jlayton@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] statmount: retry an overflowed seq buffer before any
 other check
In-Reply-To: <20261125-statmount-retry-v2-1-dingf3ng@gmail.com>
References: <20261125-statmount-retry-v2-1-dingf3ng@gmail.com>
Message-ID: <179567282158.141640.1989619625784759549@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Ding,

On Thu, Nov 26, 2026 at 01:13:48AM +0800, Ding Feng wrote:
> Check for the overflow before both, so the string is regenerated in a
> larger seq buffer.

On v7.4-rc3 (x86_64, QEMU), our reproducer, a tmpfs mounted on a
12278-byte path, gets STATMOUNT_SB_SOURCE back with this patch. Without
the patch, statmount() returns 0 and leaves it out of the mask.

Tested-by: Kyuwon Cho <kyuwoncho18@gmail.com>

Thanks,
Kyuwon
