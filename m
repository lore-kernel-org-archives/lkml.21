Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551258;
	b=aOqUQx7fq2IR0plKwk7zv3PrCkRPzlYxjnEtcZpKT2SWvNFlzDjWP1uVFUdIQZc4dn0W
	 COSwgYmWNIISHG+NVbQKfKyPGSpirKBTby0YhA2Zd4jQq34KxeBgcfHFJU/Kw7MrlsiFa
	 l6kyiXfcTL86S91pi+1HAqSszEvSZg/stwOoHF4hvLMRxCfkHv5Xd4vq4Go52xmJHaS+/
	 UR7Kbn6ql5D4s2hgCH7JtELMPc07AF80JBWBb8KKH8gZ++if/I2MWNCh1Vd9fa+vYUv47
	 C0Tit3abrneVs7iInNJCoLZw+phhQdZ3QjbWw3y4ochh3rUCb4pOnPlsLccCWXNvI5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551258;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gwIwYMpes8uE9YDKwRwuExt98zMj3YPi1Pc/xc57m6w=;
	b=H9Fg+vBU6tUcLSidAGm/orVKqUxRLp46yY1qI3thHPXArn37uB9gGNALUlTXuBt+Ekd6
	 7DLynhX89Tx6QvGI/s7ff1digbdRzsNUlJecxCeWQ2/ALfBghEvr3BF1JJogn5Hz2UZPO
	 MrEgZm9Z65WY/ofx9IDLHY4DmElnkfz4GgdGujJwi3C2qAy3WWWSSdJR9oSPq/nWotBxS
	 k6TNZIsXHP3oJUB4IvhKqjdrLvrfoRNlAFdM8QU2gMSPAa9sHpsMB0WIHgywVoPt6mron
	 ZpKvRhLTt5n5Hsmpwb6hjF8Wc/99QNZ8JfTNhrd5N9qMQ4AeZy9Ee8eVGjUBZkrmSjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VW0te0ng;
	arc=none smtp.remote-ip=209.85.128.225
Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DD0606A68F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1DD0606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VW0te0ng
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-8b4e2ec4b42so27101687b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551256; x=1796156056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gwIwYMpes8uE9YDKwRwuExt98zMj3YPi1Pc/xc57m6w=;
        b=lqqLRfhxR02AsvmTgUxEkio4CAJx+ygDqzjPjq7e+R2RC1n3IwLnk1vfY/foCy5jeH
         SEDwGyVrtT+ATu+9nFM/UbFlspJwHrVQaIDaLwuW3xtbq3i3wlwaULZB1KUqdKVhcgOJ
         3CquIr2dSuObvKTJNh0ltsNVh/Lu1c7tbDC2Tz/WS/0MIFBomREZ0PAH8o4i+yCgXmCS
         E4xu8BOYljtRXejMTXb62DG4i9Kk5qWVa+CaFQkbp0rfI6MNO5ILIjORAXLIxUih2/wz
         6V7h/C1lHMNmx6X7v/NznVMTKudN5hKuCLh49LjBFFtwccsehT9SCuv71BubwtU0hFaP
         FGeQ==
X-Forwarded-Encrypted: i=1; AL+hErGB703V2qfYUZ+0lEgONNaGEK5jKTIA+7Vxu2Uzp615H8jmV0hFZahBtvcgItpsITxJMNNhcnakx1Oz0/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pbOH9zBin5StZ+xIGoBUQMABHwskHt7s4lBxZJle8fngheU+u
	cla2ditk6LwZqi6K4b89RIIyJzz+IWxqvxHMJeR1W8AImBSkLJOaM0EHMGt6Awhu5t7qJkSTGJf
	k5zzROGtOsrCsSlwHl1Q27r5YwBZckrQMZQCL/DNUiQsiSWkynrqth98gdVM+lCaQM7aQdMgWjG
	E0XsQ9I8qjKStELNN6LzeMvSeyV3j2P1BjtCYAzRG9kgkWMc6iQlVUNI+P7fe/1WeC38EMOOucS
	m3iG8RJipKRv93mtdWwMHMpHg==
X-Gm-Gg: AZFdTZcrghjtKxijtVw0YV2qEK3RG/iQW/9nYnoWzFJ/MJiZ+NBv8/VzH08RDw98wr6
	Y2hX+T6ZqSAPulpqt8CAzN5/I/Hhx1VT6xvaMVca8MJJ+3ulUQI05QEd7oGn1r6GCXW64R7356p
	xsomBHt9fiOQdfTn1424COX+jHRzwkQxlE+0U1ibY99aB+xTdtOQCX7tVz5i0ZdtJDNlQHMUAqB
	pkrcbJtBxvZ2h1Hdr67IhY6MskBdbH9h28kSjT0vWqtzIKSild4Smc7KFqYjMS2z5MknvxCB3md
	0QxXtm6F7RL/60QZGGWe56GdGgK/MsYYjuDiXmFTvJCnikhtBdVTu2YWk2fwvdahA88wHdM5MT9
	i4lDqQvfEzXer8LMvTQ80yFVq5O6P5/Irk717S9htMBqQ/Y84iVIx8NWCGZZz8CWuXIjmWVWbT8
	jkRZnvlGNdbGfE9VAX1tWu6Ln+9kWnrZsSedZc0S8=
X-Received: by 2002:a05:690c:4a05:b0:8b4:f721:fd62 with SMTP id 00721157ae682-8b5204e1c88mr62764317b3.48.1795551256289;
        Tue, 24 Nov 2026 12:14:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b52017f19dsm1044217b3.3.2026.11.24.12.14.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9211604468aso76706616d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551255; x=1796156055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwIwYMpes8uE9YDKwRwuExt98zMj3YPi1Pc/xc57m6w=;
        b=VW0te0ngU1NTlc0VEeWpVM6IXOi0jxIkODf/MWBveiuoeOzC1mByJjbXv1hYkgjBrY
         zjxxu/OhIDbd/jMFlZhSNnkBPd3Wwnt8XwP4wfdIOPb2a9EUuHse05pTlPQeN7eaJanm
         q8U/YGEsEsPsnCEITjUwL6p95hdkZHWpzdQF8=
X-Forwarded-Encrypted: i=1; AL+hErGBUUO96xQrZ8wAAs7zlJBXy9T+pcTaAQr2wLL/IOTYBKDCph6gAKr7X4H6E3tkInSpsraYHwY3agZkulA=@vger.kernel.org
X-Received: by 2002:a05:6214:8624:b0:921:1b08:82a3 with SMTP id 6a1803df08f44-92134a7925amr276255426d6.18.1795551254628;
        Tue, 24 Nov 2026 12:14:14 -0800 (PST)
X-Received: by 2002:a05:6214:8624:b0:921:1b08:82a3 with SMTP id 6a1803df08f44-92134a7925amr276254806d6.18.1795551253988;
        Tue, 24 Nov 2026 12:14:13 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:13 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 7/7] wifi: brcmsmac: embed brcms_bss_cfg in brcms_c_info
Date: Tue, 24 Nov 2026 21:14:01 +0100
Message-ID: <20261124201402.3499613-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-8-rosenp@gmail.com>
References: <20261111042554.232998-8-rosenp@gmail.com>
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

On Tue, 10 Nov 2026 20:25:54 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> The driver only ever has one BSS configuration, and it has the same
> lifetime as struct brcms_c_info. Embed it directly instead of
> allocating it separately, removing one kzalloc()/kfree() pair and its
> OOM error path.
>
> Move the struct brcms_bss_cfg definition, unchanged, above struct
> brcms_c_info so that it is a complete type there.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmsmac/main.c        | 48 ++++++-------
>  .../broadcom/brcm80211/brcmsmac/main.h        | 68 +++++++++----------
>  2 files changed, 55 insertions(+), 61 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
