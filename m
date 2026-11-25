Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567232;
	b=CJR1SPX5RSLYbwXgZdeQ7zIYxd1vEaUrw2OW3MmJDrhvS7yWKWyE+IvEhAULZ2vxPelA
	 LiHQ+vfNVVu8PyGn6JWigOpDXLwCBoW5IiZore62T20J/yIq8Af8nchFBaZksqiBsqeFL
	 RbTu2KSc+0yimRfp+aoczLq/z8To2XZpvVOlGdxuj0kfXBKnIsLG0v669FLIbqpL4glAO
	 1+7Hqos7pVdNVe1e7ZYajTrjEwYlsZvWdgoTbT13K5smsbgZ5aMYfLHRNfHjOaGEFCHaE
	 LUEWG49lHFtuMxml1CYT3w11EQZLYgZnuiTh6xalEXbWIwf8oXx7MiwcEi/bADQFKmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tK3CNGQ4I07DEstE6/SMS4SBHKbFdsxDhUVtrDt6klM=;
	b=5BepcR8lcF0KOQEo3b3yqCUylHmvPO3r22FW74jf550NI/6Z0f8fay9cngB49FCQ/zZa
	 iIEr2KZXzAd8xVFlsTRdlMNiUU5EleHlAbo1ZLuR4KfIuJZ+HNg0lbCzX4CPoOSceviVJ
	 pnvyHjz8IAc3A04AFD4qNGkf56hfSdRY1sMZPePssvLyDq/CwidEePbHDnu+2Vjic8TUn
	 huQexKoYekjF0+KXoC4lelJHXo2OxUo9u14RcGsFOYHIwb5TNzdOErt+pHBtfLCU0fmyx
	 lUA0C9hh/Tz1WO7mVdBbJEH77lqCebxGWSeLIgMbmvwI1kgKKtYwk0zM+Yni6o6ajGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="EOEa/Kz1";
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EF8606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21EF8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EOEa/Kz1
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso5364567c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567231; x=1796172031; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tK3CNGQ4I07DEstE6/SMS4SBHKbFdsxDhUVtrDt6klM=;
        b=EOEa/Kz1GX2xjrGuCPhwAjQWknmZAf0aT7CCBs6NI8DHmNXTPlRQcifQpKThMzaGhL
         DHZbBLTiwLpEzoQbJ/Xmf4dli52hEbhjTHrxSgsfLYEfTz+eQUUeKfxT42dvZq3HiZbG
         1ow70GWmKn92A2U3NVbV2u+xzb4cFvgvSBCDtJ91/8wuWQFYEY3u+j0CFVj1RRPyBFAp
         s5QeqpYS+prHp0WzT+EKQtZ003gPLWDqdoQVV8to1nucktZjqITFuxZ41EGT7blPK0Q5
         WcfC3XP+CdWYuwM530Ntu9Vk3dM3XPKfMgHQpPNvRIZ568PaEsmKn0Wi6ZAk2Uqs86u6
         8tNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567231; x=1796172031;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tK3CNGQ4I07DEstE6/SMS4SBHKbFdsxDhUVtrDt6klM=;
        b=zA5JPsG5JWpJBFSLL3ulMmoJHlilE9YYdRr5Kpttz5Roao1gGxAUw0ZuCQDfkxuKtp
         n5C4jJYR+0/OS/tmVuO/qPuqxwU8229rtNH/oj051bdiZikxW33wyHhVmHF6JAcOiGz8
         V1JrQ0IXe9NbhADpRLiMiqrdJZ/l+O0PaQfFMHasDp0vfE63ByYj5na5bynjqoKMmvLf
         xGChqC066q90CMTeamgNMmbSHTH9WsbZy8AfAyg4QekjyNp6gzAvS84z4vl+ktNWM9fK
         8NgPBvzK/83th3O4IOhr4mucsQBdzkxnDdyO043bOhEviYMtLCjn1Mt6CN62MVWnp24f
         aO5w==
X-Forwarded-Encrypted: i=1; AL+hErFqgNcMcOmzD4EU5GrAPMAyIQ4qJP0E0OhgdnFJdqM+SHVSfV/OpwLnqGduRUu+8r92SCn7pLJ0sYyfOIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5s+JpaSr33D6Rug0UfOvuzWlytf+gOXKiZkA5UBSgjmwRZI/i
	SRXiCecnAyNoKL5bCEAMi03z/iYpu2JusZHHqRGYwVmLFD3roX4+c9O5HWUwEdW18RauXPnVqOK
	K0teRce6SDA==
X-Received: from dldz13-n2.prod.google.com ([2002:a05:701b:418d:20b0:15d:6b8d:2adc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:906:b0:1a4:c892:b14f
 with SMTP id a92af1059eb24-1b556904c50mr21237934c88.29.1795567230804; Tue, 24
 Nov 2026 16:40:30 -0800 (PST)
Date: Tue, 24 Nov 2026 16:40:29 -0800
In-Reply-To: <179545553181.3135.4354699424439095142@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119170550.1517634-1-irogers@google.com> <179545553181.3135.4354699424439095142@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004029.1004901-1-irogers@google.com>
Subject: Re: [PATCH net] octeontx2-af: Fix uninitialized variables and bounds
 in MCS alloc handlers
From: Ian Rogers <irogers@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: sgoutham@marvell.com, rkannoth@marvell.com, gakula@marvell.com, 
	sbhatta@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	elkin@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 9:38 AM <netdev-bot+sashiko@kernel.org> wrote:
>
> [Severity: Low]
> Can the response array overflow described here actually happen today?
[...]
> [Severity: Medium]
> Does the requester actually see these rejections as errors?
>
> This default case and the new rsrc_cnt > ARRAY_SIZE() checks both jump to
> the exit label, which always returns 0:

Good catch on both counts - 'exit:' in rvu_mbox_handler_mcs_alloc_resources()
returns 0 (leaving hdr.rc == 0), and rvu_alloc_rsrc() already bounds
allocated IDs to rsrc->max <= 128 before writing into rsp->*_ids[].

I'll send a v2 that unlocks rvu->rsrc_lock and returns -EINVAL directly
for unrecognized rsrc_type (and rule_type) and drops the unnecessary
ARRAY_SIZE() checks so partial allocations are unchanged.

Thanks,
Ian

pw-bot: cr
