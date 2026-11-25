Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645329;
	b=jbI4nkvAqZwYz6KnjHE+vcWX7TWgir84RxYB7LleRt/WjHxGq8MUGlJ/0jEBWTSYz6DO
	 vTmtSSbL24jqpY4cTSO+PAPIwtbaojt1PrQ21tE3vinWuAIEK+rLe41Iy6GooFA/NmFmz
	 Iw3sj7aNxCOnrW/OJBTJWSVsxUOw9MciSshmsk3Oxo1VudD1+J8jdIXYzLKGRRDQFrSv5
	 G3U0Kz98j1MEFb5Fo/5OqhWhWbvbFVVSzW2jPA2Kh1knXu8WwTHlZUAGkKwUN3ilPeCsE
	 vpkg0d+AIHsTuy+C+sWPkRzCc+PKZ4OkyS8cZ+UImFH8fu7hw0PTKPCwjykcg6iHyvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=C69/ffAPx0j1QcJUb+dT0EdjmFvbp1KocswjzV+VV1k=;
	b=0U9gZfu3Kr4yjdQ7xSICyemm1YE1S0KxLfnsP82kIQmxcKY4rBHqpnKMvsQFDPy8xCfC
	 PBuAEemam5LE1l1MSKg7MJByov+KjjWxyTg14WBHOLwsXG+NtD8bE/8i95lOnk5V/Qoef
	 ah9MTLF5lJkWFbXraGG34tCK9VKY6pyA6TfMcSLZZ3h01DRwcXISoGW4LKXv+2RL4P43Y
	 k8Hz9lnynxmjbU+xXynbx/chLbZlu25Gd9U7pVAOFJjA5WjfzN7NMfQ061kH5zcOMBfiv
	 jTcZJ/CT6ol+MHH8NocOfjdqq2m5tU+KGHC2KAEzajQytWD6duS0DJhRqNVbujATP5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="YncYCro/";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C567606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C567606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YncYCro/
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso8367477eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645328; x=1796250128; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C69/ffAPx0j1QcJUb+dT0EdjmFvbp1KocswjzV+VV1k=;
        b=YncYCro/L8CMeERC0hR+VfwS0kuYbUii91BfFPlkoqZ8fXCP+6UpSJeAat3eoGDH5B
         VfPf+L4KbBN2G+4qSOa/VbncwstLqkfqIsgcfTOhZ/1P9zGbRNg4Ji8iQupqOfVeVRou
         s23hTdL4ZR5j4Chp6g9guAWC5M9rDMP/pVzjze+t37zyJ2W8B89VXQT3hsAZ7orhGZTP
         uWG9Jrt9oVgiENIo1F5y64q3uizeLOIjGEBX6ekebhz9tuucPHT0M23x4SvQnCiUv8kU
         u6xC/tEnyi+i1nmF7zCXKQZuZ1v7tyP+Ce5UOq35Yr6wV0xZn1nfym1Hu7IP6KYNspLG
         h3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645328; x=1796250128;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C69/ffAPx0j1QcJUb+dT0EdjmFvbp1KocswjzV+VV1k=;
        b=XZmS59sUTnShPZpZq5UNovsNddg+IjGW9slrzpJkhUQPH9DZNmqgUS+zTjYKBBR2b2
         upc8Dl9h7Izl3nTPGtDiEXg3NKekXYTcGNwBmZ1uIX8CkB4V2EO0bLyFzJVrkNFY+XDD
         ZMHGbMBsk2jbMjTdE9k0DZciUbrEk3LfKDQyf7/jLOyC1hKk1b4KeI9ektgz9RwlCNLP
         HFjQFSEpgTlb63LjF25X0IxfFZ5TxmEHNz1ytbBAlZiad61Whz94FOlwU3ilFS0s7J1a
         G6cD8NKMXLS3o0mqkqIr6fG3hwdZYtCNQO8TTSmtHUmpC3eIhgY4M0pUG4jjl2sciJXz
         CQCQ==
X-Forwarded-Encrypted: i=1; AL+hErFSeqS6MBu6mdUQksJMZB8hyzmL+xyWx6DDWDxRJ2X8/6FrWKbf408zkrH5/KISn0BMVsBR7LjitR+a6u0=@vger.kernel.org
X-Gm-Message-State: APuU4Z84NVPGqk7HAVYbLKcTq/E2Ejw879UPvo3vSUXbZhS6R1yjLdMf
	VybQEBUE1Zv0sddyeefuKxiti3WAXpL1WWMFQW5/YK42GXJ+mOhl0FyqJ72hO9UjYD571g+CKRA
	Dxg==
X-Received: from dycnb22.prod.google.com ([2002:a05:7301:b16:b0:386:af9c:96b6])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:638d:20b0:375:c862:31c
 with SMTP id 5a478bee46e88-38571816d35mr18950057eec.40.1795645328132; Wed, 25
 Nov 2026 14:22:08 -0800 (PST)
Date: Wed, 25 Nov 2026 22:21:00 +0000
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
Message-ID: <20261125222102.1430675-1-elkin@google.com>
Subject: [PATCH 0/2] media: s2255: fix marker scan and bounds checks in save_frame
From: Elkin Cruz <elkin@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  media: s2255: validate transfer size, payload, and offset in
    save_frame
  media: s2255: advance marker pointer and use unaligned reads in
    save_frame

 drivers/media/usb/s2255/s2255drv.c | 79 +++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 29 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

