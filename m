Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085603;
	b=xup6BvsIcNqEfj3jSkBUWflzA1mmjx3NfSApY+CDK2rxfhV/JWjTJGxg4DI3o0CD13DC
	 C48DwDBZl0SsKGO86f8t4zB1bo8oh71Qy6K1Rntak/0sKYocDUPR6yGyahgjYMHkqyuus
	 wi2QXGsn2NTtAi8VKTE3HENZPixBdKucL8jIrih40qwfpm6Ev2anEo332C9GFaykGo73U
	 SW8TnkYSjBLtzyEG2I9ehTHktLGAP4h9lRnUVzPJ/ghB/+xIEUIz0gB1TFJLtdcYsKret
	 gjQ94VFDIgIAtGW7pwzl9uB7N2X0hATqcatxBg4Lzj6+5WAJ0t8lCMfTSu+ogdYtBoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=u82m5XYfOkixN+Gu4sy3x8jwpD0ueQ6BxZtFc7iLOis=;
	b=cnpo86cTThaphWOJMQQHu1VqmNMhuhFhJ8OJANl2ZtzY6Qurg7cknrS7h2ykph4G5xG4
	 J8WfncJEervE5XO/28Wl2h2y4+Q3EZSocXTL0gask6YniMZeOkNesyCFO7qZcBFY37/z3
	 C5za1u1qsc7ftySHQM+yuxVy/dSKhgt/M46Q4B9KFlRt8BPjUXmWpxVIFzhOGclCG4meX
	 1miNl/F5cuvxH1S1oBN2+u9U4PHMqBcCdJAEsKD5OQ31bUQj7gjrbg/ojTiUKY5Q698Ia
	 yfaK6aFWr6bs/bEH7uWQm5iLVlwZl/OnJtnl/ynHjZzgoRteX0U8LufR0gAQcnilwsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iQ6rUIIV;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0BA606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C0BA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iQ6rUIIV
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1245487a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795085602; x=1795690402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u82m5XYfOkixN+Gu4sy3x8jwpD0ueQ6BxZtFc7iLOis=;
        b=iQ6rUIIV7M0UsUNIRA6NKN+GN+fSa8/ME/likVRUE5Bdb5g7Llp4kUXaNoFBFNOhBu
         F4l18R77EQ4LI3ORH9xbQFWnh3o6HuJKmiN0ciN6PEOTrv1IRf18GHrX2bRj/lKoek7t
         hmNB/zpCbM49xuUBktNQrmcoJ5zqomNzHzsqXTLF2iBDCAP6nsSVdeGU7R0jmF2GSPhS
         dA9NJl+y+nu6Ad8KkMo+5eCE9mSYpFxcvJTBEnQ55zbs6Y9UuJrshRrWTCo1cQhOwY1E
         z5WVZg6ZJLHx7WbdXSp0e5YnIwhwyAwlkQO8deuDe0o32wdEcvaysTjliRP98bQgfJOf
         4VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085602; x=1795690402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u82m5XYfOkixN+Gu4sy3x8jwpD0ueQ6BxZtFc7iLOis=;
        b=cwkEB2Ee4LSHfvRfB1exEwri091mXAQ/I4Wojj7YBCEmAi6LZ3cSbM++qIz8SDv3bA
         4WmJO4XuMva3Te0PL/3Hh4rL3zy9hcS6Gygxm2t4Nro7G7IVrnlkXvK5SXcO5h5cG3bC
         szZiktnvtAsP1//quo0aJQQ1S4zz+Mpbz6I+ZunT3GOIE+u072nFEJS8NlglhF7MUIdM
         vKSqC3slY3mc3CQsN6og+mmnHC03YdA2JsrYVN27ncmkn0C43mi5SV1g1XZtVEXeJzNA
         K8P9bYt7bp0w6FXmni6b/7xIO2Kgq+MbTl0Y6sthhw8R3YjDr9flQVPLlHgR9i21C2A+
         T/Uw==
X-Forwarded-Encrypted: i=1; AL+hErFBwuIz5fuS3L/pE8V7fQmOnaIn+MrpFqRU4aVl5e/LZAkQQjmJFOXue6Z9NTNJuI+TuOx33OLo/nmdQ3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wv7ARgrv5UxdJ8hhF5XNQT+/a4RF/OyobFx3TETxH2AJdXQR6
	oe0BeN8utF9to4MMJIdraENulic2Fpm5mKt8jDHYM/RiCNZoYJ6S8CS7ogjDzbDC3gc=
X-Gm-Gg: AZFdTZfb73CnByHVU0TLNgvShwfyc0RRXLeydPkLGS7RrgnRir3qNZ7azT5nStxi/Ui
	aa75gQFl0Xm+O6yKbEXj1iq2L9pI88fcRhuCaTf3ng+UMQpJp+fnfCMb85Hpk2iwQRb0JqjOEjF
	IjmmJkhavuEbyImLI3/20/V2IIKLdvsFaK1Mwv2yu38tte3F0ia5jJH9Ie1eHg0nA4JWuuFOr2p
	schp2YHcA5sVzM/z1wRQYy6eXqbWEHzWwtz4GlJUjnH8UapteZyYLDosKOK1YPLJRY6QvEwUptL
	kImgSRR+mPjuIU1HxWFQNodMTruLGR1uoD3BIeRPKhpnTxM0u0lLoqeU9nLwsGiU7qliNQbIjUQ
	dqa5pSbKJkODSkccWgsYC42mXOsGOUPfPDtjhWToN1TCtcviXVGh9vDO1vBqcS1IoSP2TMUjxbN
	X1OsZi9+64jNV3OCN0AWn9+M1NX+tupXcP/uQs3X4F/u5iNkR9NYP++gJ34vOHCKSeV5/AXPSRi
	r15eWER0pVUZygU1gbrxXxnlKB8Lxu6xJzAxSDbGcMvRjArmRG7OJNWWVXB744Xx1PmPjzUSrRi
	EyRIEmoa/+VDyiMwg8qAu1onKs+j1VeFm7unxQPcuphzZyYmqb9SifdqCCo0+iccRDBOkMlfW+P
	67HcFT8ECSToPjX/wq7NtqRli2KufoP2orWlyZQ==
X-Received: by 2002:a17:90b:4fc6:b0:3ac:7e3a:1033 with SMTP id 98e67ed59e1d1-3b3d07d9ff7mr5928287a91.59.1795085602395;
        Thu, 19 Nov 2026 02:53:22 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm2246604a91.10.2026.11.19.02.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:53:21 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: alibuda@linux.alibaba.com,
	dust.li@linux.alibaba.com,
	sidraya@linux.ibm.com,
	mjambigi@linux.ibm.com
Cc: tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com,
	guangguan.wang@linux.alibaba.com,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v7 2/3] net/smc: bound the peer rkey counts in SMC-Rv2 LLC messages
Date: Thu, 19 Nov 2026 19:53:08 +0900
Message-ID: <20261119105308.2567241-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820023347.9D5461F00A3D@smtp.kernel.org>
References: <20260819023306.644849-1-yhlee@isslab.korea.ac.kr> <20260819023306.644849-3-yhlee@isslab.korea.ac.kr> <20260820023347.9D5461F00A3D@smtp.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Three of the points above are about code this series did not add.  Where
they stand on current mainline:

- The memcpy() into lgr->wr_rx_buf_v2 is gone.  3/3 made
  smc_llc_rmt_delete_rkey() read the queue entry instead, and nothing on
  the CPU writes to that buffer any more.

- The v2 spillover buffer is still shared by every receive WR of the
  link group.  3/3 narrowed the window to the copy in
  smc_llc_rx_handler(), but if two LLC messages with extensions arrive
  before the receive tasklet runs, the first one's tail can already be
  overwritten by the second when it is copied.  The result is the wrong
  rkeys being processed for the same peer; the copy stays inside the
  8 KiB buffer.  Closing it needs a spillover buffer per WR or per link,
  which gives back the memory 27ef6a9981fe saved, so I am leaving that
  decision to you.

- smc_rtoken_delete() runs without rmbs_lock, and so do smc_rtoken_add()
  and smc_rtoken_set2() in smc_llc_rmt_conf_rkey() and smc_rtoken_add()
  on the CLC path; only the three smc_rtoken_set() callers take it.  As
  far as I can tell from smc_llc_flow_start(), a remote DELETE_RKEY flow
  is not held back by a local ADD_LINK flow, so it can clear an rtoken
  slot while smc_llc_save_add_link_rkeys() is filling that table.  The
  rtokens are a fixed array, so this ends in a lost or mismatched rkey
  rather than a memory error.  Taking the lock in the LLC event path is
  not a one-line change either: smc_llc_cli_rkey_exchange() and
  smc_llc_srv_rkey_exchange() hold it for writing across smc_llc_wait().

Best regards,
Yehyeong Lee
