Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567234;
	b=gzFWYmPG9X4FqfRJrQeeitbZIamEzysUCY4G+nVLNSJiPHavHDtGH5v+APeydUqXh2DS
	 UT81xJNvde8vDR32CyZC42GUa/eOcpWrc0TwG2ml8J8jqM2fl8dI7GbcxfblcgKIgMySF
	 LPQLzfftAL4ycUvFMoWKiB5AfFiM0Nhyu7c2JJUuZUHnoIZ+q/dbkayg0uz3/2jkLZ+qE
	 LoxcrHTAkjcmXA3N9kDbKH12INRktSb8wA8ncvfas0H+oQKtjDGFYqp55YMg0qmBNZXST
	 plIzcF4G12operKvAwnLz1ozIr0XEYqwZgHpf88Ebf5mzWzZhRtOSMNN7xK8l6Tq8Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iQp3FL1AhJWJCBrSbW0bWv/J/BYowcIJDYfUbu+myC8=;
	b=Gne29OiwyDhUO0qixUJiFmo/KTS+Yha4I7nPF6qIY9XKumLBKUe1IGn9dqK6ebZAn494
	 04nDO0A+g1S86l/UrDKkJEd9mpKMZqcyXeuzVQtzR+nKHNm8PSRRLRxn8Ka56Tuwe4HU9
	 2Go4jt8P04b7ur0CrgmBYs0TNg7gjQIaFB8F7R8EdFXrm+0Et5v5vN4j8PXacUqHeQRuk
	 ql/VtllWEWJzCgSdksRXKi3XG7MlftGcfNZJ6xjpsV0WIePJSJVSO1vIPxKJPXll7lSNB
	 T0oDZmjLqaxoW++qlh83XZjjSC20kEZjnaomrRRsKZfQr1RQXOD3EE6lZIZVwI1ld/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cQkII5RV;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9F8606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D9F8606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cQkII5RV
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so8079900eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567233; x=1796172033; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQp3FL1AhJWJCBrSbW0bWv/J/BYowcIJDYfUbu+myC8=;
        b=cQkII5RVHEmWNikZXpQLx3zMH5fqR6sM28sz4cTQL4aAidFTedYAxNIUAa+u/jgoRT
         ildClxhnM1XrKQ30Qpu2VDDRNiwSXeoR89KekXFsKLtGlY3b568LJJAmyTaKF65vDcWw
         hs10tJuSWdvDHPCW+r6IXwnqHVgl6jVpQrpYjFvpPk427LzJuJCosAp82VprZPHZLG4j
         huvpmwJL8LAIqFV7MsNFnHtnhFSy8X55EUCGQWocYMU82hBX97/Q4TCEWE228fYUIRBE
         WIM26UotWfvpIb0BRO+Zpyb5ckUbSxFk3w0Yq1eTTSperQlDPzRt05MubgxK4JwlIOdP
         u8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567233; x=1796172033;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQp3FL1AhJWJCBrSbW0bWv/J/BYowcIJDYfUbu+myC8=;
        b=iD3d0bdNmkJVgg0oiIZ7ufIsYXGWhCYm14e31OUZ56YYLAGcp6MKxEcZDdnAFGvoiz
         ah4vuNcFPND4nN9LK6iyqEnV8ZU5ACBO8UJtiCaumKPoTLqHE+SG9b1QESJ1KvMNEGtP
         ANzSi9QuxR9pyar+fatp+frYzdxlHw5QewdpjyyAv5wKzZ/a+uebN9F9pyCtrjaDAejD
         CXYR6qOBwAVy0q8QHB6DrDewxADRE7IR/47YIA9wahodE4c8+F2HZ0Gken5JfXpq/TXD
         U8tZy5CkGaBBFdIYnQAngmu9Y6BkuupatmgSC0Yx8gWnKMuBleo6FFq+tiuRaXUInBpa
         /eug==
X-Forwarded-Encrypted: i=1; AL+hErE9VL2C2YIAwE0rTXvm9C3n4H8U5CDo7fmecHJMXq/P0JPX/uv9aUtEzP7I0Nx1jGjEmp8lpII9SQuX0RQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JpwCemiRz3zd2d/7A+rMOvezfcCcCwfRaX/+5GHNEkWaP8BmM
	QwD3ulxM1AdIDWHCYl7JRlEOYySQCfKc2ncCfZsPOLUNeDNvCgrLAz1OVrQMTWg59FlP+chVMd4
	tK4HhVR5k6Q==
X-Received: from dyvs10.prod.google.com ([2002:a05:693c:42ca:b0:385:6c3c:3ea1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d205:b0:36a:1f8:a56e
 with SMTP id 5a478bee46e88-3856fe564a1mr16387145eec.23.1795567232754; Tue, 24
 Nov 2026 16:40:32 -0800 (PST)
Date: Tue, 24 Nov 2026 16:40:31 -0800
In-Reply-To: <179545939880.3135.6341792822211409455@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119170729.1524516-1-irogers@google.com> <179545939880.3135.6341792822211409455@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004031.1005034-1-irogers@google.com>
Subject: Re: [PATCH net] net: lan966x: Free skb when PTP TX timestamp request
 fails in xmit
From: Ian Rogers <irogers@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: horatiu.vultur@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	elkin@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 10:43 AM <netdev-bot+sashiko@kernel.org> wrote:
>
> [Severity: Medium]
> Will this tx_dropped increment ever reach userspace? lan966x sets
> .ndo_get_stats64 = lan966x_stats_get. dev_get_stats() adds only
> dev->core_stats on top of what that callback returns, so legacy
> dev->stats is never reported.

Good point - dev_core_stats_tx_dropped_inc(dev) is needed so
dev_get_stats() reports the software drop alongside lan966x_stats_get(),
and it avoids an unlocked increment on dev->stats.tx_dropped as well.

Daniel, let me know if you'd like me to send a v2 with
dev_core_stats_tx_dropped_inc(dev) (and netdev_tx_t return types for
lan966x_port_ifh_xmit() / fdma_xmit) standalone, or if you prefer to
fold it into your upcoming lan966x PTP TX series.

Thanks,
Ian
