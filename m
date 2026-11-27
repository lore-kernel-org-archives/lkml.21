Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792420;
	b=MfioUC2unZdaxbEtRUNDxWzIEq5cYhvKTIVaufBbP47w5q5rr9hETiMmUtJURVK0Ro3U
	 vQGtJOt/0aGCmQDXJDICPbLEymlAkLnscG1ooY374mD9JVg3Iz0Iv/Dy2iC9pWVwOwp1e
	 5MJBgOhgDFjnYWGVH3JOHUkn3UEb8trqX9c/+HCfAJcqJgdescemfI2txZA77NKAoUlM9
	 k4GjrprL7PN9iRXhKm6jt/nMsUbBvgkWDjs+nvdWMuu0e+fBpXgiFwBcYZlBhhPd0i+cI
	 PcJTKjBMqxabXcLtM9Jh1LZk3Hp7Vvfoh87oLgMuZKdOxAextgmrXe3YesEzqVvBekw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=R4ZdZ/Z/X95qaVtYQz57sFrlKFBZaBVJXWXtnEfxeZw=;
	b=ZuMsNyRcStLPmPY+/GhsGfXk7eK99jaSMdjv9PDzFOUR1QzNlGJIaWzo2Nhk2mNNqX+J
	 8xRiUh1ZSygV7Q2NOxUs1xo9H/fStdo1Vf3bEpk+2rPzgCLrkV0qOejVE1FfCIjqqFH+r
	 MSsX6QD+0dx8Xu2TY9flaTmKRmhYUkhN0INPJ6kqhRjZ73S1hPZoCTnE4Fh1WhSQ8Mu3E
	 krpuMPxwhrXC0RLrE3XVQTSjHdv14SaLbZjMrNYXuJpO54EXOwfS8a2McJawSdcc1pUMT
	 /JuqnUfby0Rl/iS/jHzsrYsBQEx3wjQqA2KFPAydWs/bZ9wYr1ub9+hueSnWpFHH1JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i78wvBAv;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D434D606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D434D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i78wvBAv
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a799d93bc3so3908907f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795792418; x=1796397218; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4ZdZ/Z/X95qaVtYQz57sFrlKFBZaBVJXWXtnEfxeZw=;
        b=i78wvBAvohyU2L3IaLOUfhATWQKDRKARv9EAS2PPUpzfz7y3PK8Obs2ufTxRvqCVF7
         IUC7PkHbaobjUqzf1T8l2yA/sXGEdEA5Io/ruAXE7otzzU+4uqpsQH+VcEE7sZdogq8a
         4X6MKTxRGMEBNEqVxfgwJNr6RUizh3Co2oOZTvE7dXgadGM2nBTER50M7S6ahufdymkO
         tHT4i+n7GcnXGIBJ1R5I0C+DVL9u7zV5qO9VLAnIFlYCS780gQjPIaZlXSBEBo1jb43E
         nnEwlab7lW3QtYqfFjup8praiFYJWKg3iAHrPbzRnOAyvNVrI6iTa7z8mkCwhAkbVt+R
         U+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792418; x=1796397218;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4ZdZ/Z/X95qaVtYQz57sFrlKFBZaBVJXWXtnEfxeZw=;
        b=yvEW2poYLD0VzZYJKIgpe79wX1vOXomnFvGeqScCEty79dTVljlqpnwO4u3VmQMpA9
         NQh/o3FbIXD7bAJy0vuZAeWikpf0YUjTX+PVhZpYqm2DzdJycuGGS78B1+/3rAWnNVyZ
         wlAd8sh8mUozvTFuVihuAysGu8etX70QxXAzhLv/2bpzaWjTrIpDtfHiJz1pqAr80I69
         R2/EvQVfFuyfHpX27YA2gYsOzVQbxNQH+5BN2zfngSoXfwZrAfc1uXLgc5QlfboIsSux
         aVXXynZAD0QFwCl95URgKok71inwnakmX/xWLM8q9TUseUtlXXXUuLHQD7uUHgfrlGlX
         Z1ig==
X-Forwarded-Encrypted: i=1; AL+hErFuf9Wbp5+1LViWcmQPzMoW/kYq2v4c6Nv1QflZ+uML2QiQeVECN2ejCZCZv8NRt0FFLvu8UVKIJCIOKIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mKUJs5N8Uv2rw/x0OVjvuSgDLmvmQKuBlBkF64L/MWM6sjRfu
	44C0P4Ycupt4Ngtm4RJmos1nLc6AMene967J6tDK8Bl8Mm4+W7KK9+rb38x774H7nKxU2Jt8KbO
	gXZelZNE32P+aG1fS+spjbQ==
X-Received: from wrpq17.prod.google.com ([2002:adf:f791:0:b0:4a4:35d8:cd7b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4809:b0:4aa:842f:5f78 with SMTP id ffacd0b85a97d-4abb759e947mr46727558f8f.46.1795792417605;
 Fri, 27 Nov 2026 07:13:37 -0800 (PST)
Date: Fri, 27 Nov 2026 15:13:22 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127151326.515232-1-vdonnefort@google.com>
Subject: [PATCH v2 0/3] ring-buffer: Use kvmalloc variants for big allocations
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Several allocations in the ring buffer code scale with buffer capacity
or sub-buffer order and require high-order contiguous physical memory
when using plain kmalloc. Under memory fragmentation or with large
buffers, these allocations can fail unnecessarily.

This series converts those allocations to their kvmalloc equivalents.

Changelog:

v2:
  * Drop "ring-buffer: Drop redundant ring_buffer_iter::event_size". (Steven)
  * Rebase on 7.4-rc4.

v1 (https://lore.kernel.org/all/20260922072944.1281427-1-vdonnefort@google.com/)

Vincent Donnefort (3):
  ring-buffer: Use kvzalloc_objs for user mapping arrays
  ring-buffer: Use kvzalloc_objs for remote buffer subbuf_ids
  ring-buffer: Use kvmalloc for ring_buffer_iter::event

 kernel/trace/ring_buffer.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.839.g22a8290db9-goog

