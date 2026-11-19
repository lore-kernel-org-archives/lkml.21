Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113700;
	b=QhT8fj8EMY0OMGGJmnfogKytRfmDEjd/MhExwz8cfCjIORKlaLMbRz3yqrA4om5bZ59M
	 Cc+JVMcWNe7Erzj55gawMKEnKPXSiUfiHdzT9y/5ALjw5NOwfYgcvvco2xAqF8D6hupbJ
	 KfRttro4zDn7Ph+J8CEP9D7xeiQHuI6ZY9a8hhqFGb03fl9hTlAaPxXQP9VWp3ZEjJI5S
	 z2ThJIJeGdUZrtaD1hM87aDeGP8/thsxX2VF/th4IOE7PytTb2HxtSkPmGUMOjuNmQA2a
	 5H+Smue7b59eLsSlkMtbppSVH/73dyEJXuGOm6mdAs/LD/lH8/W7qMiOhZnMD/0Ow+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3oqzFwD+s0Nl69O1Eok31JQqbm3bISsPDHuFAF54jKQ=;
	b=0acBBtytgNiyOmz4EHYAb8WUYMCgDQjkfVhe7xm9W8NpE3IINJ+3boo3wb2+H7cjMxvU
	 21r3asr4HWELTJwigbwLKEsGDZH5qKRfqtspZBM/Yl0Dqa72qoitIRq3u7uuweslXOai/
	 oJzC410dEkL1vEKxykBXQSJfm9JbCwzpL+tT4+fR8sb6wbAg2t2lsakeKQS9P+NaKLtAZ
	 whmZ5QWVUGiLPtps16VlVMxyM2u8ZHS/yW+rS0kEHOleKWGsTzKpkRriKQ7PqSG3XqZ0F
	 pmaPM69he9S2SGX6N7arHfiwQDlXh3sRjo7CI5cHey31fvVxob6MVtIbJaMHRBxjWbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9BYHoq3;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CDC606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6CDC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9BYHoq3
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91f11161831so1041466d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113699; x=1795718499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oqzFwD+s0Nl69O1Eok31JQqbm3bISsPDHuFAF54jKQ=;
        b=b9BYHoq3rFIfb4HQCB/3roUBAWgn8WMpS2EUyTYs+06XnbPDNe2j8sBH0NDiGzb4j4
         h7ewlCp7TyzGEvZycrmALIMQymRxe/zSVLdRbJDloZs1qbZbjHN+EHFbdbElzNmOm9oy
         R6xsybTh4tOVlZ5Z/Y6iv07a3IkybcxgX7blSOtnvX16ifzYixB9A9iY37RbTwiGrPen
         m8efDmKZvv2k2zYD/ZnFWmJn4dtHpWQRqt7XBJXqnvioTrJM2HnZYsuHZWlT6kijCIZl
         KZ+oiwNdyReL9EG1wCWBb0jsHOV7x1j6ZXbN2KHlxY6GJcWigcBjFhffBstcKb9u3/6J
         pBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113699; x=1795718499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oqzFwD+s0Nl69O1Eok31JQqbm3bISsPDHuFAF54jKQ=;
        b=SY74RyG+VJAciFWajS2YlXYLF4WDKuMyLD1n5I2PdzA01XJ88daxbziNkVqspFjF1m
         08gbrzUo91q+Jnxtu+cTJ+AZ8bru8umfsLlHizbXlTBMF+pn2kIyX70xTOZQeTpA4w0I
         p50HoLQGa+qDrjGVNLZIo2K56El4kO0g0jgFgbgE0vTZt0POITDivt6UzVglBQteLR20
         dsGsBhv/QTXlcPdT7j+tz92wFjOvZmk1riJodV4Ph3LEO3Ac/rVp4isKgBd1YpIqEKb9
         ym89W3YdqjsSvoJPWCdiEJv9XGkZC0oa2QpRwk75/mzINrd8KunLmlYP/DZnE7EECBHW
         ZXsA==
X-Forwarded-Encrypted: i=1; AL+hErGlIPWpJ9bfRkiIy8SwaGJb3crCf5nw7syxTDz8E6bagJ8qz49A20lwEAA7paAFLSEZZP25eXaJhaRfbgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EsfarEfq1CGoZe3zwpD6650czn2v/Sw4Fx/8GGDEDFDJ+l0XV
	MMJ1D1EVPhNeGbFEtHto83KIvcCEX9v6AvR0mhfDN6nGJMESg2ukkf1i
X-Gm-Gg: AZFdTZf30Kjl+Efi5yLMuLfGkhr/cgqG6qxhVuB/ftSyivm4SXWOzq7zT9BN5U7HDvm
	3aXdGsfulaoYnLeIGwlGbZtvFtR6yEFbzKcJbyVVk+6Gk6WgWe7af1RLQeCgsCyWE6W0n9Rb4Gt
	zk2cL0J5q6YnH2MCgXVcA2q3dmSZWtTDYBOXljcX/TWmrg5VSGjBcIKtW38/2ZWeJNtqPLRX40I
	IIRIFbNv27zLwB7Bgy/DDkGxYtcaki0JKrLcLXItHBUQbsiSc4X5cLzTHlt7OgT88wnVjAfNczW
	NyuBBg3TQbHALt6FmQ8wxTGOvOJ3OFJnUwuwIexHKwpZkcba07yMZEWal6SM3cli1VO+Yi8Rdni
	T81abHuSg+MlQa9h55hFr9xJcJpcrE7FEYpKOnN1Gc2H3/k03CuJSDssnywh/LEhyWP9r/lnWCr
	s9TvE+07xjAUAKmXNkbb+3dwICZDVSjeffY0q7cT0ySOgc5KOrL/xaC5iXkR0wW/uhOFTQrZuuw
	RMxbHb9HromXRU6+widozOSZ32vnkIqfwaeT4NaJ9rVed1TWwm7jJ6Fc/c9eF8E21A/UqdgGCm5
	h9lcLFj5e2FlULuOzV+wLTGtg1kzaBqEkYbnaDg7NnAarJdoFtD8MYudIehcNdRXxTvSjzQhvyj
	V354SUkQ/ZrdHGOjB9CGCBLOp/7cKua26H/d1qhKCRwHJzjMYNP1p0rQQg6PpXIU0p7wZ9HV6WR
	CWaiakSGk6Y0W5/CJyfuNV37UEPkg=
X-Received: by 2002:a05:6214:458b:b0:921:318b:2ddc with SMTP id 6a1803df08f44-92134a9fee9mr8196576d6.24.1795113698650;
        Thu, 19 Nov 2026 10:41:38 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c935:f347:a919:9f78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bf848dsm4226386d6.44.2026.11.19.10.41.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 10:41:38 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tipc: zero the pad bytes between bundled messages
Date: Thu, 19 Nov 2026 13:41:27 -0500
Message-ID: <20261119184127.24931-1-astellman@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
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

tipc_msg_bundle() places each message in a bundle at a 4-byte aligned
offset. It extends the bundle with skb_put() to cover both the padding
and the message, but copies only the message, so the 0 to 3 pad bytes
before it keep whatever was in the skb's tailroom, and they are sent to
the peer node.

Zero the pad bytes. Commit 81c600c26302 ("tipc: Dont send random pad
bytes in RESET/ACTIVATE messages") fixed the same kind of leak in link
protocol messages.

Reproduced on v7.4-rc3 with two QEMU guests as TIPC nodes, booted with
slub_debug=P, which fills free slab objects with 0x6b. One guest sends
60,000 SOCK_RDM messages with 41, 45 and 37 bytes of data to the other.
That fills the link window, so some are bundled, and a packet socket on
the sender captures the outgoing frames. Without this patch every
captured pad byte was 0x6b; with it they are all zero and every message
is still delivered. No other kernel changes, debug code or error
injection were needed, and there is no TIPC selftest to run.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with the same tool and reviewed
by me.

Fixes: b97bf3fd8f6a ("[TIPC] Initial merge")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
A reproducer is available on request.

 net/tipc/msg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/tipc/msg.c b/net/tipc/msg.c
index 39dfd33c8eec..b0d52609b03d 100644
--- a/net/tipc/msg.c
+++ b/net/tipc/msg.c
@@ -509,7 +509,8 @@ static bool tipc_msg_bundle(struct sk_buff *bskb, struct tipc_msg *msg,
 	if (unlikely(max < (offset + msz)))
 		return false;
 
-	skb_put(bskb, pad + msz);
+	skb_put_zero(bskb, pad);
+	skb_put(bskb, msz);
 	skb_copy_to_linear_data_offset(bskb, offset, msg, msz);
 	msg_set_size(bmsg, offset + msz);
 	msg_set_msgcnt(bmsg, msg_msgcnt(bmsg) + 1);

base-commit: 1e575bda30acc0bf01f799cee798d4a1c100d538
-- 
2.43.0

