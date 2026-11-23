Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415460;
	b=KB4sl23N45bXijxlQ6knwO7ZFRI2tgzSQWB9fQejzjOkQyq3yuQHG/KY2ASBF9jb5CWT
	 EWTvlZn+h97tZwVnC00/Fp6zBGLcQz6YP/3YvG9uoLrvUdktptogAH6tM+OH6hL+e/K0T
	 +KhWPL5eqvkp62Msr++llDQ8jEcRwmMffNIMl+zs7OvjGbEsQMKoEVsvb3+6k6Jx2axqa
	 dZdUfgqD+1RCk1+TJNnT7R+YgpB5fjImtmG86O8MsXC/5hkSA/puJnQnNj+R4FT42QVWU
	 JMpMX3AcsYkvv2JwefKzX8O0tSTzjMwZx0Iu4QUtO/j8PWLC0t1w+Q33Gv+NzpWrEdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FC41BXf4VJWZQyWR3Sgt6XorZQrlBJJIAm976pUKW8M=;
	b=HAkXH5ILC8BYLC5DEH6Ed1XdAzvXd4sv7nHmOZIjQEjVWOPyIgJVS0MPkTfaEuDsd6PF
	 fhVOWKgqsIDUQoCPcvwrPvenL+11GOzdDbXE17DMZUx9lb2QC+0SZ7L8K6Nrx+IzmLhEA
	 CIoQybnV8sZ4ReIMXw0IwPxNjczcKlViQ4dv+//cdZcyS9C31sF+LO2ilDqGMj3Aqx29+
	 RFdxn+95b+dOoRDHtRyXyhDGgbSXo2A2Ax+IIwTtmI+IS3kHKNuHym7RkNthVsDCS+xGt
	 duobCwNKq/dzI58rsV2bCY96C0D6LYIh2rzeSzB8veM3uEumU7Nx9VRkve8a0YaUVKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MCV/B79T";
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF1B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF1B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCV/B79T
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-77bf892b496so938509137.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415459; x=1796020259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FC41BXf4VJWZQyWR3Sgt6XorZQrlBJJIAm976pUKW8M=;
        b=MCV/B79TQ3wl1OdvCn+/05GbGxrnVvp2GCl6elyGMM5cDPlxm2MBVUl8bcJfQDByqF
         lmvHk/8pHxIp+YJE2XJKD8h0Nr6+Pd4DqEr5K9dpkOoPI3v7nWIlY931RtjgledVuQZ+
         /tEC+dmRnWEVAoVyYXKuLj05ole/RaCJ0u4XtErdhr+Js4VXQ3NlvwBJ8rJIKYwRo3lj
         Xk8uyGtHpzrzzw33YW/TGHQgGQEdja04pW39IadJ03Zvd2XtAsi8DCimddQuy/AkVHxs
         LtSIypsXCTyVkipJWvcQbBBKZ4WehbcQ4lu5569txprj4HeyGNLejCAtWTOl3X8Birj0
         D2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415459; x=1796020259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FC41BXf4VJWZQyWR3Sgt6XorZQrlBJJIAm976pUKW8M=;
        b=GuAoFyhyp0AirUH46NsPCuQ/L4SaOd1cQG384AecFtsQUWbKanV2QdJlbFYzcDlalB
         Sal7PxHiKONwf4l4ngwHFf0WbIYQVAAlwu382QL0GkRDXJ8gmoguUtLu1PSfr+Mcs3k4
         9t6XVND5nMDgdfPj627QzIDq30kicmaNV+PJGlRxueOOmXbmZdUwHbk1KKxtpfF+3ch4
         1g/mg6oudbkW9XsWdldwLjfcqbhueUOtYopmq94vc2LUfjylEKs0vrHMxSgM/BG+7khZ
         AfXOF0cGkveTvFb2dw2zwFgUorqIXN16bNxBqOXHFPhjD10DwVkrhRktLXDpQMCCK/Nk
         N2Zg==
X-Forwarded-Encrypted: i=1; AL+hErEQfgBGSJfKr5QBt4CRB1l3fdqs6R/TTdke5l1i8uA6rjbUJWg3Iw2yUU2Wj48g7D748kTR0sj6xDjDFzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OqeKncF/L4q+KiusebCjY4FP7J+cSJjAwKmNAcqdwR5C8nnqr
	AfHeYmeI7XG90s5+kStfLM6lKRtS3lXwSs4J98TVGGlpKrCk7uIdRNiI
X-Gm-Gg: AZFdTZdWglB958Z2TcwkCT5shfOH63OIMncebrIj2/ZaN1dVzLqTx7kanUPn6V0ZK2j
	8TSjZJev1uZ2QCj2z/G6nB5OQk0euhPoI0VTyIwZz+aKFG3QrfI+dPFO7VaidZ0JQDFvmd2JT2n
	xC25VDQYw6A+tPbbB5wSO1oA8uLuwymJWbpJLYbyE3QGffkv9hY6bwgqXgn5YCtbxwNVDQRlsE9
	9ARG0nKpoMFeZGvVXdPt/aaFMUoipawv58+rLSWXqbb2ImqlWiTk3GfmAoD6io/ZbLLcV1nkeYs
	eDhwjWOoP5mDcKYo+QudtrIYCLifH4QuZAeXMXbjkWke7Leo4oLk36Hsk1W9LzrbXkvLHjuI1iV
	LOdbZ6QlraJdf1J49kgQ93RBlvERoW/WlhDL0gllOPxRkz6OlCOIGWnwbeNgdUCMYAZj5flsmzF
	1dEgjO26KmnmXPIYzI6v2rp0Fmxrf1ABJYIzz0vVdQW1ZjyuJMyF8biXpjChBUKsbYtnrdjt9Zh
	rGBB+hxNY78uCHIRkQ7TsyknblW4O0sdwtCobh8SNMYU50ccgQDfeV3K6bFf7jHFeF8MvGI0Uui
	54TszNWkcYTvbVegDhxmZNQg6kRzwgBuRuy/7XThp123DgU1ote0yMXy8PKAIml0ZI4=
X-Received: by 2002:a05:6102:8097:b0:7c1:bc57:c7f5 with SMTP id ada2fe7eead31-7d7393c9b97mr4057528137.12.1795415458558;
        Sun, 22 Nov 2026 22:30:58 -0800 (PST)
Received: from MacBook-Air-91.lan ([2603:9000:d440:53a:10be:9c04:cd21:d4ba])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e822a085sm10595144137.10.2026.11.22.22.30.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 22:30:57 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org,
	Eddy Tsalolikhin <eddsterxyz@gmail.com>,
	Kyle Zeng <kylebot@openai.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v1] tls: fix ring wrap in sk_msg_memcopy_from_iter() after splice
Date: Mon, 23 Nov 2026 01:30:55 -0500
Message-ID: <20261123063055.58813-1-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120225720.89044-1-jiayuan.chen@linux.dev>
References: <20261120225720.89044-1-jiayuan.chen@linux.dev>
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

On Sat, 21 Nov 2026 06:57:19 +0800, Jiayuan Chen wrote:
> tls_sw_sendmsg_splice() forces sg.curr = sg.end after adding the
> spliced page.
>
> The following non-splice sk_msg_memcopy_from_iter() is a do-while
> loop: it advances i with sk_msg_iter_var_next() and only then tests
> i != sg.end, so starting from sg.curr == sg.end it wraps the ring.

I don't think this addresses the root cause. The copy path in
tls_sw_sendmsg_locked() starts writing at whatever cursor the last
producer left behind, and this is the second time the splice line has
been fixed because of that: c5a595000e26 made it move sg.curr because
the copy was writing into the spliced page, and that change is what
introduced this bug.

This patch does close the splice route on mainline but doesn't touch
multiple producers that leave the scatterlist cursor in a bad state
for the next copy:

- tls_sw_do_sendpage() on 6.1, 5.15 and 5.10, where this patch does
  not apply. The bug is reachable there too, as a race rather than
  deterministically (won within a second in my tests).
- the record split in tls_push_record() on 7.1 and older.

The copy path always appends after the data already in the record, so
it can set the cursor itself, in tls_clone_plaintext_msg(), before
cloning: on the last element with copybreak at its length, or at
sg.start when the record is empty, as sk_msg_reset_curr() does. That
holds whether the clone grows the last element or adds a new one,
covers every producer, would have made c5a595000e26 unnecessary, and
applies unchanged to every stable branch.

I'll send it as a separate patch that tags d829e9c4112b which caused the
symptom that c5a595000e26 fixed but introduced this bug.

Best,
Agustin
