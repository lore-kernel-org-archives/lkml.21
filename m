Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108283;
	b=eTIujjVkUmgjb6h/dMY7Reag7yez1wT0L8WrkGkrJ2Ne5+BXcW9xfHIbcpOPOOLGtaxF
	 N4jRA2xkG7eM/1cgeqgrrxZJVebHXj2+ym0gDR5ry6mPXFhUM0589g/RT0SUhFGKNu3pQ
	 F8nz0o7Mzb5W/NHlExhoZRg7ZuhxspEQvClTVqyObTv8rN0iLciLFWs+rJWuVHvXIjXgj
	 fZna3rnQMuti5td93jF4g7+5huMn7EFSSFTyfT5z5IIzXuyAdvoXmWTdRgBsLYD/92hXj
	 V+QDA55S+Xg7IP09eSXEsjTQBbv7pOyrBw6AlIKcfAXyps1qdVqZNvY8m+uxlwoXKyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Ko+MjmiHNLM691UwBxmQgih73Czi8IVII6J5M6Yn1mM=;
	b=pi4uXshJzLe2KcHAD97tjw9gcln8VGA0g2CMcoJjCSKoZ8kqA7aDS6yvjqD2hUB7519h
	 qSpicy0FPe6/33XgRsCz/+U3gBWLuWOa7rhNn+PpJkz0lI1bF4GBjt8DvGCngcaEwnS2q
	 YUskbgG7mBVX39FkK+qSTkmPpy/LhYi9xZ8ZDBM0aT0PHhqoePZ2GSF5/WEKgh87HFMFb
	 rp84Itksx9aYZ1Pcu9FW/wp0ktJPCtcqo3pjb7/eh8e71uemHCFm6lVnng94rKdzOlGqI
	 zk1CZalWf0jDCXcxV6GtBfLXtOWrxnxdm3PcUi1jnm1ZhOvABEAnylOsVzBGtBdcOPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lyMZaRmj;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03CE606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03CE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lyMZaRmj
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b45597c7so4735401c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108282; x=1795713082; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ko+MjmiHNLM691UwBxmQgih73Czi8IVII6J5M6Yn1mM=;
        b=lyMZaRmjhCGX7+rYzWUansfk4MP9s1YP6E7qzUWUW1XDebDWzgNRMaURTDhjrmflD7
         u2RZz+K05GoJOBtAVT7c81qfDQX6wQJeTM0A6ND1fURG5ZmF4EqNYYJ8R1zGtbe+a+C5
         u0DlcKb0K8dQ/4kupfGPOwf3WRmdEg+mSOp8OSXjaDeKtHA0XIYoCJti27GDms7z0Oc9
         AfD9FyLOxhQ9+GoPhasheX0FZIoQNqrk3bM9m26bzMhkaKlX0vvP1mAdD7p1TPJf+QNy
         9bBVgu1C+FACzcRLAv0m/4Wzagc+/MIm9KcncfF8OxSbRqv/wCEYQXPzazuVa5Gi/RxD
         OKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108282; x=1795713082;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ko+MjmiHNLM691UwBxmQgih73Czi8IVII6J5M6Yn1mM=;
        b=Pc4xCwXIZiShv/V5EH+wQ/QYl3Mfl0EDt6jgozuf/zhfBGZuU6F2d6kRoOzpG6/mZU
         Ok9aDlWfpC7R4a8WeiPOnQ+IpcdRjGRSrpzDxR4KOMCWSGOzwf52ORWPN8ijck0e9yuz
         TbKsWrGuQIDESm8WAMikVZktldGZwFSl8IMUliT0akwZzZDINgdeOebhgIKC7yNBksVr
         Q0WaKakKVl7XrjnY8T3dEDbtJRW3bcuNE4ADjPP6uFHVLrwQPETqNwLgfwLk1O/D3fC2
         KHAe39H6N8Rd9BZJqxz6wk8skI/Jz2ugmvuv6rdX2NU+reuzP8s9K6lr1Eb3hIPByIQ1
         8vBQ==
X-Forwarded-Encrypted: i=1; AL+hErElD/bWm8vDTgG8WArTBOKhXS8b5DHmaI5yn3QgtgR6Km5mfMqduSnNUS7uyOgJXvV+a3QczNy1INR94D4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q3DwxyfG4ZcbV1L2MwJuea4uKvodw17okVjIE+66oGQow80aE
	d6hBvMXRbkZhUFczufnsKrrRs7WII2WUI590xP4Sx3hsrdPpU3Y05RBT5zXmGrYME/f+JIfTZl/
	j7LLj5bGE0w==
X-Received: from dlbsn4.prod.google.com ([2002:a05:7022:b904:b0:1b3:b6c4:6fd4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4308:b0:1b5:1a6e:1bec
 with SMTP id a92af1059eb24-1b5568779e3mr259172c88.10.1795108281678; Thu, 19
 Nov 2026 09:11:21 -0800 (PST)
Date: Thu, 19 Nov 2026 09:11:11 -0800
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
Message-ID: <20261119171111.1538575-1-irogers@google.com>
Subject: [PATCH] ASoC: sti: Return irqreturn_t instead of -EPERM in uni_player_irq_handler()
From: Ian Rogers <irogers@google.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When UNIPERIF_ITM_UNDERFLOW_REC_DONE_MASK fires while
player->underflow_enabled is false, uni_player_irq_handler() sets
ret = -EPERM and returns it as irqreturn_t. Returning a negative errno
from a hardirq handler triggers report_bad_irq() in note_interrupt()
and bypasses unhandled-IRQ storm accounting (while also clobbering
IRQ_HANDLED if an earlier status bit was handled in the same call).

Leave ret unchanged (IRQ_NONE by default, or IRQ_HANDLED if an earlier
error bit was handled) instead of overwriting it with -EPERM.

Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
Verified by building sound/soc/sti/uniperif_player.o with LLVM=1 W=1
(-Werror) and -Wassign-enum; not runtime-tested on STi hardware.

Fixes: 76c2145ded6b ("ASoC: sti: Add CPU DAI driver for playback")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/sti/uniperif_player.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index 844ddcfc421a..63dfe2b4d304 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -117,7 +117,6 @@ static irqreturn_t uni_player_irq_handler(int irq, void *dev_id)
 		if (!player->underflow_enabled) {
 			dev_err(player->dev,
 				"unexpected Underflow recovering\n");
-			ret = -EPERM;
 			snd_pcm_stream_unlock(player->substream);
 			return ret;
 		}
-- 
2.56.1.708.g77570a6a1d-goog

