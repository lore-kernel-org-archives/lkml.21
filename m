Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773590;
	b=FSAv+bXMSaApp9zVMHo6WpDV2JwTgliTvHrNwgxtIiYhcymThdCSlJVL1kOmYI/EHjXC
	 DfmqYv/B62FwDCjT4HmnR5wzRiun5Uvg/PjdNSRqhWSDS+f1ikeaYpKt4Q4KhmF4jzFsE
	 /0VSo9CqgF2pc0GgJdL+L5Ik5mda/T7GD0URo6BVEXeqJL+23ddcyMt5jOT+9bsGRDM+k
	 3WgfcbqzUG3/CkWIGoPWMGsBAWS/BGb/d/njmzfJN/7Bmq0YpyavQZCAiFcGB6GbzbD7q
	 eRlIr338KkWF+qfPIPbFsaDGoV/3KO1d+G2B05HK/iGUl4eb8RgkyT0Q/2INUhCu6rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HXRFd2cOQNGMDoVqNtgavt7+ro/SHVcuYq+oVmWUa/o=;
	b=AFNh+BOHYnEQhWV2A5RbtCDitg30Tieif5ox+SlW4y/qPP/TYM6Ck47G8T/xSHNr2z2/
	 QoOrEsMhHcqY/PgzKu7wDPNtE032CwzF4Jg1n+B1f4fm/FGYtEvOhz3aIRNkAWFZCBOVS
	 7BPgYGMp7pz3MXaW3bfcSUUWbJzqKF+fqu119+x9ndPxlnzCdsCjz4vWtArcj7MHaDtfh
	 D2o6N22AdcYSxvY7KanNsXK8Apv03jRYewMQQSqKiLdHGcJrItMS8lJqfNIr21X93paEY
	 0+QHox7bYPiByRZpbmM206FWxmlU7DtzZEzwGEMFzGv9HbaTelKUqTNg6sOqzoK2qIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0QhIu3W;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992C6606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 992C6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0QhIu3W
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50933bdf4bso1489827366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773588; x=1796378388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXRFd2cOQNGMDoVqNtgavt7+ro/SHVcuYq+oVmWUa/o=;
        b=R0QhIu3WgCK80EmN+8wbvDiPq89uiXgOMhnArI5XW0kgdPoxIIMMQPEv9EOAfsRKt0
         AoNSPTQvWVUMM4mR3xNEeahH9jWALBDordO6pIF33Ik/2Mo5C3IPhwcnqsq+axKxtIIJ
         WK8ZLgpXSB7hGEon68r3i6Ns60Uc+NUjZSd8GmMswWuYVjyBc+cKOWdffY4mXGalac8Y
         ewm7Yj+5U15Jl8xAW+cWs3wGF0L3cmcsQCvOa5+hEw5cc0U1FoSdxdROgJLSu6baBfMV
         y5LmOijPxYDiKIYeIXATWP0XJvuNPyByrJcvMP5u/0OZfiCaxHuvlIsD91v7PuE6uPaH
         6heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773588; x=1796378388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXRFd2cOQNGMDoVqNtgavt7+ro/SHVcuYq+oVmWUa/o=;
        b=dL3mTyGPgymuL+ryiYnw7zhi2xHXo5fT7HYwdzN+QeqKkARINikCsSEwDT2YnsJDWG
         HMuwQKOigJwQ2YCWXTTplwmmUcP02vZ363V1V3qzcS8b9SEq1OLA0sP3pFg+ThA12EDN
         vISjvyYTW0po6aZKMP8iB/+Zgfqre/9jFq0qPhyRY/eHrpPA81ZGv1rCVPojwhWDQcQ6
         kff2HimJ0kykZCDGswXLPlgiiWo3wPnP/m8TxIcyP7U6bcVBaDuhI9TFkmQOF1rskM8g
         15kpM3Ed0VYauDDlT/L4rwB7YpqOru49fUCFw6R4W8HFMlfo9QnubBPjI19Ny8Bh7Dmh
         38cA==
X-Forwarded-Encrypted: i=1; AL+hErHRKqquZ6vN++EU6kQz7T5Vmtcsdqw6w/1Uf7JZpTqlOhgfs3p5p54+Qk1zmSkeg1PvQkPK7mXNrSlg2Cw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i24d7P8FFo16QXqWjn++MdDlRhcYc4BK97mImu0InT7SUTMfB
	0OcYMtLgM/hypPKHK5x7XoDDQVrPwqLgtb2CLuqClSEmbk6GxPj+rX4p
X-Gm-Gg: AZFdTZeaBUgGzqq4S0krJiaY2v3aGmP77jWS6q0BcGV8Dxk7BMc2u51/prXiV2bYlF/
	Wgw4o6MmhEnhK/jVsRQiafN++AqfgxFrMwWlT3IHqi4BblrGOODtDPwix9+gQ96nMHsq+gmyg/6
	APbvHiGu+Yos0b2rPVCWCqWiltckyOfzjs8xPWVY9muixBeDgQpMvO5Io+2e0tfV7GW9ymbn3Lc
	13H7mE1hFaJKL4A1vFj5YEsY9XgH9tWeGOWDGINlRhhegQcVyiTsW//wlTp8g9HqWHGHQhxnxn8
	HdH7vybKKAXh4+3Mu8gLEmVtr5y7dWTNT+HRcMtqA/OxQoiLKwQ+/77t2L8I/DUB3oIaKkKdIXG
	qNqneEhsHJ6sUaZuXvv/tK8kQ7a92p/PwMTunu9mNUqxGVRIrgsG3DFGzp/EfnnThdorwDYYId7
	3IXqUO3/E0YuUTPWBc9ngdlgiSge81iVQYtRo+oZXRYsB+D6EjSa7d+Kgol4TVxI7k21aSuBDOn
	wp/YMuHOsWVAYDS4GVvivXJludtrsqfuGQ7odSDhCVY2BXQyh+NwR6DGIJQEf8R02cfutq1Bykw
	uKBybRFmOIOkHXM1nnCJPFqPQAPoQw2YZXN01Ajy9kAC6m5iOH54YqglSCQAGTfZz57Qvg==
X-Received: by 2002:a17:907:968a:b0:c42:bc58:f21 with SMTP id a640c23a62f3a-c51d5adb93emr163106666b.15.1795773587905;
        Fri, 27 Nov 2026 01:59:47 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm841249266b.37.2026.11.27.01.59.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 01:59:47 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] wireguard: selftests: remove a peer under load
Date: Fri, 27 Nov 2026 11:59:44 +0200
Message-ID: <20261127095944.17844-2-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179577288974.3135.10854019193613008297@kernel.org>
References: <20261126094722.73025-3-apasichnik9@gmail.com> <179577288974.3135.10854019193613008297@kernel.org>
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

Sashiko AI review wrote:
> [Severity: Medium]
> Does 1 MiB leave enough headroom for what the new loop can log?

In the runs I made it stayed well below that: about 217 lines per
removal on average over 200 removals, and 340-400 KB for the busiest ten
in a row. But the worst case is what you computed, so v3 raises
CONFIG_LOG_BUF_SHIFT to 21.

> Would setting a non-zero message_cost while the loop runs avoid relying
> on such a thin margin?

No: the "Keypair N created/destroyed" lines are rate limited by the same
setting, and the object check at the end needs all of them.

> [Severity: Low]
> Could the commit message give the detection rate with the default
> NR_CPUS? Or it could say that NR_CPUS=1 is needed to reproduce the
> regression reliably.

I only have single unpatched runs there: one with 2 CPUs failed, one
with 4 CPUs passed. v3 says that NR_CPUS=1 is the configuration that
checks for this.

> [Severity: Low]
> Does anything confirm that the peer is actually under load when it is
> removed?

Not in the script. In the runs above every iteration had an accepted
iperf3 connection before the removal (10 of 10 and 200 of 200), on KVM;
I have not run it under TCG. I kept the loop minimal as Jason asked, and
can add a transfer check if that is preferred.

Thanks,
Andrii
