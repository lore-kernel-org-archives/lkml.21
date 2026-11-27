Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774970;
	b=P6/A1D02G2WumvEUIlisXc6nZSAfLroAW9GY/vpiUKr7w0LyVVTgeQTOGZbG3pklID+N
	 HbRNsKuifI7HYO6b5WpPUK3HzEczlwQHOC5QYPoijr9YFHWy72MNeOifX23ZjLk6BR/Il
	 CcASsP49bjl3fHclHfZoyJ8bCUDtXiPrmRoGWqKP0Kyfmaw9bsP5oNyuTVOpdg5ows7b0
	 ZjN9vXCvWC6TrY5WOaqXUU4VpUlwMxmtVtvd/DtAvYhOvMBt210pzO/Sa+q/sX5NdokQD
	 MICUl/d9EIr7VLJx/VgHXXPdkUr+aL15jzylclwzwoiDFndWkSe8ZRSpB5HRFBUe/Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rcLiYjm+Bw7UNaKZxYLwAijXLTVgk+NU4KBS0kQqv3U=;
	b=MNDIMGSN54mZotbhX9bgE5cm4qyS+PkKcizsEi22ESHueVgw2/f+Ao7nR4tcyGEB+1wh
	 jqcwgbgbRwKVhicA2VkekXouHvVi+ZFvcdZTbWlSus6spW2uuy2C2lD0RSC5RUgBO4NKF
	 5LAcBeObF5SfxDnH8ypqj138dHyV+7gC9/v9e+FlgzyC97ZETU6rzojsU/9a2W2wPIIw0
	 Bsl9/IDr8ll4ujTy2plGHU1KcEim9vkyzGL5UY5ci5vJbxYfgoD9ctP0Sk9/KhPtu6cci
	 BBSDZBT1z2bO2SjILW1NWrtGdDypL/jnXkK12zUVI0X4yJDHzwFu71hvZYwlIjU3sAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPY+kzT3;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4283606A6B1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4283606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPY+kzT3
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so9026934a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774968; x=1796379768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcLiYjm+Bw7UNaKZxYLwAijXLTVgk+NU4KBS0kQqv3U=;
        b=jPY+kzT35XRacdl/8zgOfvZ99pEl+zFMT597HKM4mIj4QYGbAajvNOjFula5B87lYb
         ziNy+8KI8skqfjiGuaWvwMezqrmQfD3/lAcFxRg1KghJhiZQbcxIHJPSZKHWeeJj0N5K
         M2h8TkcqoVoVFbMoiH2cwak7V4OcW+KQNzCB+VLmsQFLdeJ3A3WqWAUFK10wh0tiGrFH
         fSOVW3C6jDwbY3IqNitahlg4yUqifsfmiUvvxgg9p8Ziz+gc4Y8lljV5TYqN+ZLzcFZH
         qZsc4+zuE45UtBXFqUNbJOC5dsWFOFgK/wpdD1TXcprR5ZloOsmqSjBYDt4SrsrV13Rf
         6Ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774968; x=1796379768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rcLiYjm+Bw7UNaKZxYLwAijXLTVgk+NU4KBS0kQqv3U=;
        b=lIaQDXxjKIvPhsWcDgVi27W+vWOzLxN8IvQCXDgcSDrk6bVcx6A/v3KjdAfnRAlUn9
         l5Y8TNa4NBoEKmytcLcqi+VGy4A9NsKuWdqpSSVcBYtDud8OLSnVg8yHcKj7bI9YHE85
         X7ZeTAk6jKtRTIef4res555TOkYBlFKR+FYS7ZwJXHaQ6xX+dQXCvTMd6s8xOFjgeety
         EMpYXLdb0Og/HMlR/2HB9/Pz8UeZeW59rceeVYIV5Dzy5BQataUS10q4HJJsV8SwIuZR
         oW6Dd5Xm6zMyZqvoFA1zTkxN9u6Hvsqm5rkyIb1OhqtTnnKWN+SAMUodI9N1pxMxG6Ev
         5+0g==
X-Forwarded-Encrypted: i=1; AL+hErFh1UD3iMIqGnHIUb+TVaIRqmbEG6964hrJwQ3W2CXSDjQDX0OTfJDepoH6IiIjIesnBVY3/BSHyQ8qR6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sk+kpXvTxtu7z8yEdtYQBXpwqjhC1B9b1432MBSvhlKVdvGP+
	GyvC68mvhFjCehHyA+lT7ReVLRg8vCJUIHPrO1bBWlCd9irU+WnUaDzC
X-Gm-Gg: AZFdTZduFn7zwiVKQ6d552gbRjtpznLF0Qre0bEnwq4yQJjoWB9BOrzR061YMr0DqM4
	ls2PzuAHnrS4csaND9azqoNHNcLTMTDBh2JcTPP9QutUrzoJt3vU6cFlP192BqWyJU+mkaXVTLS
	+WOdBaHR35hJRzp7iRruGJFoZ7zuRpmIdv4rYG4W7UED/ogAOgVB5uEie8O2jtDci6A958+4Wkz
	U0O7WpJM0fGq84LXlmSg9xtL+ZzgNnkI69KzdBiZaA9Kud/lw1zOX0WXbf9iNAbbUqEF3gFnyyf
	C2hOFqWOBS5y9ZRvCLmXoOuJYApq1U7urLgsGKxuATlVrBweSkJT/nLDLkPkKNoM8jBpPMNigMv
	YzN4WagAYhvM13RLlnwSPLClWNoe8w9vVaeoLGfvcD6/oXrY5nqyl3cHsfNVdWYtZNLCigfqdml
	5aPHJm/d0PC7LjdWBvNWc3ki2hU6JBbg/HHlPjgjcWwOuvogF8tAusGBrYnXEisxFGrqPtQTlZW
	a1jh8IOnwTAi6CuahU0cFCaWbi+A+2ZQGzjB8VbKQyWwcGNOHNYrRN1U/lJvPjWBphgx1/6smYP
	R3mhWYgC7bsVKaAkDZXPT4zDhjThzwT+v+GegfqfGRk4BBaeSjMa7csuIMe825rxhEw9TA==
X-Received: by 2002:a05:6402:2105:b0:6b8:7e86:3eb0 with SMTP id 4fb4d7f45d1cf-6ba37ec50b2mr16425783a12.40.1795774967795;
        Fri, 27 Nov 2026 02:22:47 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm10886407a12.9.2026.11.27.02.22.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:22:47 -0800 (PST)
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
Subject: [PATCH net v3 2/2] wireguard: selftests: remove a peer under load
Date: Fri, 27 Nov 2026 12:22:43 +0200
Message-ID: <20261127102243.49405-3-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127102243.49405-1-apasichnik9@gmail.com>
References: <20261127102243.49405-1-apasichnik9@gmail.com>
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

Remove a peer while a UDP flood keeps its receive queue busy, re-add it,
and repeat ten times. Packets left on the per-peer receive queue keep
the peer and its keypair alive, which the created/destroyed object check
at the end of netns.sh reports as "merely created".

The ping after the re-add makes the new peer handshake at once. Without
it the other side keeps using the old keypair until its own timers start
a handshake, nothing flows in the meantime, and only the first removal
happens under load.

netns.sh sets message_cost to 0, so every removal under load logs up to
1024 "Packet has unallowed src IP" lines, one per queued packet. Ten of
them overflow the 256 KB kernel log buffer; the object check then reads
an incomplete log, reports peers as "merely destroyed" and can miss real
leaks. In the worst case the loop logs about 1 MB, so raise
CONFIG_LOG_BUF_SHIFT to 21.

The loop adds about 13 seconds to a run. Without the previous patch it
fails in every run with NR_CPUS=1. With the default four CPUs the leak
is hit much less often, so NR_CPUS=1 is the configuration that checks
for it.

Signed-off-by: Andrii Pasichnyk <apasichnik9@gmail.com>
---
 tools/testing/selftests/wireguard/netns.sh         | 14 ++++++++++++++
 .../testing/selftests/wireguard/qemu/kernel.config |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index a8f550aec..8303802c0 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -207,6 +207,20 @@ n0 iptables -F INPUT
 ip1 link set wg0 mtu $orig_mtu
 ip2 link set wg0 mtu $orig_mtu
 
+# Remove a peer while a UDP flood keeps its receive queue busy, then re-add it;
+# packets left on the per-peer queues would keep it from being destroyed,
+# which the created/destroyed check at the end catches.
+for ((i = 0; i < 10; ++i)); do
+	n1 iperf3 -s -1 -B 192.168.241.1 &
+	pids=( $! ); waitiperf $netns1 $!
+	n2 iperf3 -Z -t 2 -b 0 -u -l 64 -P 4 -c 192.168.241.1 >/dev/null 2>&1 &
+	pids+=( $! ); sleep 1
+	n1 wg set wg0 peer "$pub2" remove
+	kill "${pids[@]}" 2>/dev/null || true; wait "${pids[@]}" || true
+	n1 wg set wg0 peer "$pub2" preshared-key <(echo "$psk") allowed-ips 192.168.241.2/32,fd00::2/128 endpoint 127.0.0.1:2
+	n1 ping -c 1 -W 1 192.168.241.2
+done
+
 # Test using IPv4 that roaming works
 ip0 -4 addr del 127.0.0.1/8 dev lo
 ip0 -4 addr add 127.212.121.99/8 dev lo
diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
index 368fd9d60..1adf7cb6e 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -67,7 +67,7 @@ CONFIG_SYSCTL=y
 CONFIG_SYSFS=y
 CONFIG_TMPFS=y
 CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
-CONFIG_LOG_BUF_SHIFT=18
+CONFIG_LOG_BUF_SHIFT=21
 CONFIG_PRINTK_TIME=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_LEGACY_VSYSCALL_NONE=y
-- 
2.43.0

