Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108159;
	b=nJPIIBkS0LE1JNINcmM7PYzdFO0Lx8A5suRxZFTRzHNqJb1stRqIaBhHvNciuOicp31W
	 VI89Pv2myqZcbs7ArqEsLan5f0CCjjKAkOb5PzoYv49Roiv0uN1voPEynMijjT9BbmCa/
	 arWTyclhsVCNxARhlQpJrATAakCnDCIMs1uHbnqma+sJD7PUMpBan/4bHC7yzsj2z1eaL
	 m4D/77fQ/fM9t0EBf9D8Ky73Jqw7t/RD1S2DLNP+BllvzJ0krCG+6cYhuOwjnk73aUKiQ
	 WRci0CEnfpi3QZgVzkWrz2Fwd8qjqK8Mg+inerI1wooXaMN2j+tbYgdokZm1cKUiz7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=reI4hG36wSTlZBZHqaQMIOTRXTTK6qV6ma9NRye/4cg=;
	b=MjV80L/PRDeCk9b/hDgP2RYUCHD+I6hCGVG6JtZBimev6d8f37Ew8CjARVsfxwTRcveD
	 OQDHrcaBvUUUC8BlWaM4jhafngTo0aaDLfbouuE+DuKku1ERqU65m5SKeQK6Kd5178o42
	 jyBPGpeJiuDuHJRHBZTNoyrY8w5yceNNUB18Y7cM9iReehof2fLi4031yVIFViuiJPIQn
	 cgJRcx0C1qeVBxkbgnwFYBTv4NnalRCz7DNCe0Abld3VU49CWiRlAT4pdpiWDkV/CpSP8
	 j3Dfxee+YcPMgBzIks4Vlfrj8jr8zs3+Gzo+y1nAn2f1u5wsMexx9rEZHNCrR8tEMfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IKQzNMeT;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6859606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6859606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IKQzNMeT
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e778acdbc6so27677b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108157; x=1795712957; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=reI4hG36wSTlZBZHqaQMIOTRXTTK6qV6ma9NRye/4cg=;
        b=IKQzNMeT6Ak0BL4jb88pzyRKvZPt4detlG21tIIvxMTeBEEorg9Ei69gJFzmeP5E+x
         rSaHsPhAU4qiV7tMtF0Ule7KuLv65cTBB7oXqmxR+SoWTVJ2C5hxc4B0k7KQW3/vS/z+
         qYHqmWXsX7VrJklf6Hs+nJc2Dzz9Zz1Br0jkCrgHbKRjjSuqBxKwtmvPvXYRfj1gGtHC
         3A06Eb5RYizI2MxDqzyZs1V9gHfAzR4z2pTq+IEAViy+zzk0D0mh+M/pApZDIYvQanoI
         QnA3N7FtE9ZwJrgiltuzLDrzEuoiawejaTYHP55jxHtamX/tycqFakpd72KYLkyxVciu
         8yIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108157; x=1795712957;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=reI4hG36wSTlZBZHqaQMIOTRXTTK6qV6ma9NRye/4cg=;
        b=pqZXHcsx0DcMBjd2crKHgAl7xSMb2MQG3oJLSSXeT9C/bYds743gE6cYbNm+jyDlsH
         +5qGsKN2zhdn9CPs8k5WFR2cmFAIOpDFUO79bNdPySx+kguUjuTjT0jKFo4EnBSwN89q
         Du2ScDHvcJQpLS97PoPNUwFVTqEz8aXSPnNR/+sQk+xbs00RTwgxzHJk/JAmTMe++elj
         lGvftyuh8ZXywkv9ydmoJ5RlThqAk4MEUFXSxXAEil8KtvU1GnhhoPIrqo3FY6tFBlxs
         KHaZTTDbkTjWqKWSdY7Q5Ufkyqa+UBoRYnIyAQD4yBOPKaO0L4Lqdng6Y2ex4+372Ggd
         zkQQ==
X-Forwarded-Encrypted: i=1; AL+hErG8Ulgn3PcCAPr6/OWV0dLKfk7bgyuwaC3/5P6BeLAtAaM3mfgfzhMFuhfK5iDlRkgLWHtoOK2sz1Nlcug=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2OUO2xk12wVW/jkKwhhlMZhuXPpfj5rzQr6UKlzIY3GyN7nXt
	SM46zzxWdZnobQrLHyC6qWlxfczd0va8+nNYN9LypbTVoVjbtsg+jePzRCmOMc+XkYaa+IZQxfZ
	GFBa72Jik3g==
X-Received: from ioi25-n2.prod.google.com ([2002:a05:6602:c659:20b0:9e0:f209:1acb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:14c3:b0:4fa:8d48:3a5a
 with SMTP id 5614622812f47-57a0b44ccfemr598788b6e.38.1795108157215; Thu, 19
 Nov 2026 09:09:17 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:09 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <cover.1795106967.git.irogers@google.com>
Subject: [PATCH 0/2] wifi: mac80211: Two return-value fixes from Clang warning audit
From: Ian Rogers <irogers@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Two return-value fixes in mac80211 found while auditing Clang
warnings (-Wconditional-uninitialized and -Wimplicit-int-enum-cast)
on an x86_64 allyesconfig build:

1. Return 0 instead of uninitialized res at the end of
   ieee80211_reconfig_nan_offload_de().
2. Return NEG_TTLM_RES_REJECT instead of -EIO in
   drv_can_activate_links() when sdata is not in driver.

Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on
wireless hardware.

Ian Rogers (2):
  wifi: mac80211: Return 0 from ieee80211_reconfig_nan_offload_de()
  wifi: mac80211: Return NEG_TTLM_RES_REJECT when sdata is not in driver

 net/mac80211/driver-ops.h | 2 +-
 net/mac80211/util.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog

