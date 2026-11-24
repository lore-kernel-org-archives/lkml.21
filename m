Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556440;
	b=yvPAW3vjXKN+BlGyTjecNbBZREvs7YSftYOAX36STJVZPVroUz5CHI1vtiC7K3sSNNw5
	 YHHMAYIggNS87t0aqXFaocvgqEPg4Z7YAU3EO++m1rI6oQQVlZwpLaO6sLll67M1vdyVj
	 sawNEYRchM9AT+PRRReFDpbfjxnA1kHj1Uu4coNmtKianOSaoMGEzwKtC74YChca3ljZT
	 Dw84kwwrQR3uocwvUiPP6xdAQUWhIMCSbl0Dgr0N8mn39sCy/vgiYamzVSWK9P/Zedx8k
	 hhHyZfERc4J9KCxtjbGe5E/HOWIy0rIWP8t8KJ1+HvzeGAhbTj8xDe32kurNk6gHYXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G/eu3V3hH3gYq5N6oYxvKcGt2JCj5qQ6/XPw1INj0j8=;
	b=TrINlH1lA08hstUQnbj9F3yaYor+sRYOLILOVTxluH/4PcKxe+z4XtFH3kntCjKWVoB0
	 FzLxG2OouAw+tqSr77Z+/C+zyKVgNDM7bfVwiAwNu5bqnvu5eGTa1g9HK4UfHDbIyEvlC
	 IzjrgEU5W3iMCZ9MdZWkHNZzv/fPtl897BuGbA2mm4P0WUCnPkM4glLmYJVK7ZwAWqlha
	 IdAy9YuAFeUge1wtmRI3Tkf8ZH4qlncD/HkZkg2jli1NlaWg8LkoX7yJsB0fYdrh2yRWR
	 x1MK6gJtXVLcaoZScLciUswOWyEp+vbctm6tnUbpt6cK2ZAvm1lfOq607Rk+KVzICZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mi8EGLvw;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E51606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E51606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mi8EGLvw
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so5460575e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556438; x=1796161238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/eu3V3hH3gYq5N6oYxvKcGt2JCj5qQ6/XPw1INj0j8=;
        b=Mi8EGLvwatR57ciZPnajH53XIycar73TLMvtuIgZrwr8o59gtggQQ12mCJ91lZsq8u
         hmGmFwVYMPA83aVk24Xo4veC+N8ONh3aWgqYZaZoz4Rhy9FAgEDUPPVsJmp8wl4GM3cL
         dZYyW2R8epRb2L0WJ3JORZ52Taa2NIbTM1aG9RIXISLhYWq6D6F+2jkiqBUz0rVeL33V
         gjPJBdJRd4sdJZwTjxdQxtzokdIxRo6OkKAQzVKfINPVLgmCW9YJ5dVdo9qV+ccr+sB9
         rAbO/DsbVfBFUSsTo1+IRd9DBn5E4y82XPqJYb6REWyfmJ46mh0zyH6v6LgS5tVwjcie
         fvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556438; x=1796161238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/eu3V3hH3gYq5N6oYxvKcGt2JCj5qQ6/XPw1INj0j8=;
        b=CkZnGpnOMQpm0FH8qVKQJ3Ls005ojc+U+cfdCuLv+m7H/a6Xp6cf3xT2aU3KMxziwV
         XxecRXJ05p9AsiiSMxbP6Vs1O7OEm1luDxwj4nrCQQA7FIK3kHmvqvCt96Wg+rL8V57i
         NvOmV0MCxH802TNlMMCGzmHgLnMwZ/eEI+wVqHYUZs+PPBnQ22PcPh9On63y4PUwT6on
         Wi1bD5bQbvqHnD/72EwVKPJLgWuViSpeAOoT77v03NrViOApPc4l33tha6gEz/DlfEOM
         EPrEiPoTFtCP4ayA1a1e/urmCZN0UO6RyO29ingWTWLg07RzKS2izKhfmlD3uBKYd7nb
         pWVQ==
X-Forwarded-Encrypted: i=1; AL+hErHqlmnElwAgAmUmWBb3SjEEaWv+0506/entCOo+xtosRg3gq5+1EOlxGQotRnl5O427uPHv5VaqFTMC5rM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e3x9GJmDeUvd9E1AWvVXuZInqlWvpuUJ1Yz/uCCIZAVj+Do1l
	C9O/49Si3ZYe/qcoSbIvszOQY5p4Iij6grN1+TDeXr6hrsyPnNw0l6Cr
X-Gm-Gg: AZFdTZdGFoDNgnAmjapwkLx4P+mAL/G88h69Me/UPjQ4D/7EhG74utVVCWiZLYE8Jvn
	ZOEE5WzgGBm+dKSWOZXtQgJXX96iA8zOGuykl0flPYLAVPaAc/x3eoHKosuz425nqQ/+uVL2FdN
	LTHEHinDsHRtex2mca+lU/AWGUGmwqy9JmFE2Nnk5GbpXuM3iWkys+lfCweG3IYj7Da0cQ4hDcM
	3x4iUry5f7anTwttGbMtFOoJQdDYkJwIT4s2CAX2w2ez9uaWT5EQqOgllw6RJWHO1ITFLOwFwWl
	S4xfGu8ZlERE3Ao6kXwcCeDgxtvWcRW04jHCWYCj1TS200EgL6tRtTyBDB6KX/4yrSiCrIG35Y6
	tYn9nmH9ZhXWWK/ovpdU0rsKbluGiuzgB7D+UhoYtjCdReG4xPV0cD7OQhRGKFfAxmnDvcaopM8
	flPtlQF/gox6168NGixp4n+x9u5KmP7r35idKNtMokle6rQM+ne/8BKYIe2aAaK94G1dYei/ISS
	7CJ4VVnbM7IN6AboeVvrVkTuzHjoeJLglnwiPWdlOyYioP1R51SiFtAjF1mrJ24TjWZIvEuOow2
	70GR3a0jXfKB5a0bLjN/WwtjO9VAct6ucdrZPDcL956Q2+r60OlHv8eerMHi6TjkYXHZD12UXe+
	U/B8RdSS5JerWRQ==
X-Received: by 2002:a7b:c84a:0:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb887ec609mr239453505e9.1.1795556438029;
        Tue, 24 Nov 2026 13:40:38 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm28290872f8f.34.2026.11.24.13.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:40:37 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v7 0/2] selftests: net: veth: propagate check failures to exit status
Date: Tue, 24 Nov 2026 22:40:23 +0100
Message-ID: <20261124214025.11603-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Four checks in tools/testing/selftests/net/veth.sh report failures
without setting ret, allowing the script to exit 0 even when a check
fails. Set ret=1 in chk_channels() and the three "bad setting"
negative tests identified by Tianyi during review of v2.

Patch 1 fixes the invalid TX channel test, which used nproc + 1
to determine an out-of-range value. However, nproc can be lower
than num_possible_cpus() when CPU affinity or cpusets restrict
a process, meaning the kernel may accept the requested queue count.
This could cause false failures on a correctly functioning
kernel once the propagation patch makes failures honest.

Use the kernel-reported max_tx + 1 instead, ensuring the
attempted value always exceeds the device's supported maximum.
Spotted by Sashiko AI review of v2.

---
v7:
  - Fix [1/2] subject numbering, lost in v6's send
v6: https://lore.kernel.org/all/20261124211645.5751-1-emmaonana18@gmail.com/
  - Squash the two propagation patches into one  and add
    Tianyi's tags.
v5: https://lore.kernel.org/all/20261121182217.4609-1-emmaonana18@gmail.com/
  - Retarget to net-next and drop the Fixes tags
  - Move the invalid-tx fix first, so no commit in the series can
    report a false failure on a correct kernel.
  - Fix the subject prefix on the invalid-tx patch, lost in v4's
    send.
v4: https://lore.kernel.org/all/20261119003003.40482-1-emmaonana18@gmail.com/
  - Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
    lines within 80 columns (thanks Tianyi for the review).
  - Add patch 3 deriving the invalid tx value from the kernel maximum.
v3: https://lore.kernel.org/all/20261116084107.6675-1-emmaonana18@gmail.com/
  - Add Tianyi Gao's Tested-by to patch 1 (thanks!).
  - Add patch 2 fixing the remaining three checks.
v2: https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
  - Correct Fixes tag to 1ec2230fc721.
v1: https://lore.kernel.org/all/20261115212117.48496-1-emmaonana18@gmail.com/
  - Initial posting.

Omokefe Emmanuel Onanaroghene (2):
  selftests: net: veth: derive invalid-tx test value from kernel max
  selftests: net: veth: propagate check failures to exit status

 tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0
