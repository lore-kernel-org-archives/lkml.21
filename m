Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173514;
	b=GPLexA0/G9xioE4zSwgPTFuhDF9LkbFYCB3Urqhvl9erZa3mJvMkOT6kGwmNOi+cfn3z
	 U+4oBI4sQYCuon47UDkwrENF8VQKQIWW9LeXRt/quusXiTUENKU7PxtTaUYnW/3x2rS5V
	 qHH9x5nV8QcjclRZZJgQCpIifQSuKnDATa0sBWWtHL3SNNkNqwtUIkoJaECd9WSBBR37/
	 7pMMHgQV1OnDmeQ665qkV/qU4NH/oR+TEbl80AQBAPB5Be1iAwQZ6RK9766AhApOKMLs4
	 sOQ8rILfGUdOVCngWQ6HTbUjaINCd0Jt9Yzk01IAe+xmFTbfZnTfhgkmYM0D2jFPslw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zpsVdJ3WbR6kE2v38VJhuAhS7jEKmVk9lGuvUfsu2RM=;
	b=jFL0JK2HrRbh8MBpaQLbRCaxsA4oqtQ8wNuTj4vITpHvKHKg9TRNmEUXZkXzkNnmDQTu
	 iPAytfhB+EXdMDtKWKOpI/JPO4OQEt27PDpKFPG63cF9IgPXD7LiIXnHbf8wVcS2kaqIu
	 nCTG13Vgh2w4p0+sFd9x45QMmK77ZEBbrGGUTeHAAItvaGN4ukMy0mYbTkalCKHkM1yKV
	 GCq65KMRpbjPCJvKG0pqvigpM3sye+ejWCaoaDWXG17HoNL4RFcR5cu9u8cJsYrSHZfmL
	 v1VhrqWtkuqtCkLSK/ThakAhFeWci4l9jx4atZOCSGZm50Ep/gi65xvPqg6lr/ShTFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6ksLl8W;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE03E606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE03E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6ksLl8W
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so686628f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795173512; x=1795778312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zpsVdJ3WbR6kE2v38VJhuAhS7jEKmVk9lGuvUfsu2RM=;
        b=k6ksLl8Wgr8uXVydDfgGczdMdtHhae7G2e4mHkti/xXNX0pXLzhmNd1u8OjFrLFblr
         cXQOmyyMUKxTbLAVYW72nAYfBxUzgL/2Zp/H90r3jQJDfZ330WatI/7V+RfTna2aRfkN
         Nq6Ahe1GiJK9ubZhwRVojV/a/+TZxT6PUThkkvNYP8PQv0vc55ZErsK2+pz1/R3JnX/2
         IrKhvM0Fhs9x1AoG9jdohDUz7GGV6iyghDjDNiLecB8NO0urveA+KNrrMkOcc5xHSWVi
         pYO6Bu/lSkPxlA0qzbjUa9iYQVYScVOkN09CozVKuM8qniLnwOFgHsDVoYE8TXTuA+1I
         FE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173512; x=1795778312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zpsVdJ3WbR6kE2v38VJhuAhS7jEKmVk9lGuvUfsu2RM=;
        b=SyN4WrnESdPh8p5IZgHmN7iSdvW/Dfv1lv02s+28XHXZK/ZXr+0lZ5sxUdmhW1fws9
         KT4g909KzEvFbQxAaNBOZCAYBX+GLDNKnW5YE0+VbbtXpP5vIP5Loa+dbo09HNs38RaE
         dcf6ug2KWwLWuWrxPGvRibM5mzoxD/kLB5bVO22BjrNZxC8WLACsQbP3JlINhQEjz++l
         u6dPZb6PWPFH3hBsxL4bE0T6DPjEceCLd3TPxcnhwklvUYC1WZQhKaKxTLQnizgYgMGt
         CUPOT7aLpxb94++L0nOYXY3bxueRuMl5GgJ9ufxl8QoX4pNsKA9L9EjMiEEWbaXxntF9
         A+bQ==
X-Forwarded-Encrypted: i=1; AL+hErGNcvCz71FNMYZkg/4pN7GRs3sPyBVaePv9tvj+eUUAnPFseZloz/K0JBCZ0+SwLoMPRhpc5KoHyZde2cU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a21+pHP2joMYjP+OMXdDs//cJhlT+kAQY18NhxrQmxEifUSNp
	uBV4tCkoDN9/ti8TO36QEdyduM9G55da2Ewj1VI0SQcBLNXjLbleODZ7
X-Gm-Gg: AZFdTZeSPv0FTkwiDD3XzqppilX727/S/wW3ZKk9bfQRdif3Rs8C2yd97mjbtphJKrP
	ImT9/vj/tYIurBMS9gBR4WbVwM5NUAXjL2icoxUVfP3G2sRGsO/2ZAF/k2mLjW6T4HbHJbI7HL3
	ayc4vrhX8rXuS27xDfkmPryQlAaHvkW8Bt0gc3FdJeTQGMPdQjMbGg12hWJvPSv42/fCPwBrsdm
	Gx9KLwQQdgnk84BdJW+AoN/TkwkfkkEnn8MaTcvynx5rcJ9fU/CM5zRilt/Ae1a0diH/M2XwR40
	4M8L2hGGAaUNFdt1wp5hIiP+8VvtSivlUEMT00C41OA5q5tLD6L0LOWYzxSgjA6gSC4gKANqY+k
	dlHmfpF4Tcrisj5y+QlW/FUDz31GWZBBeqC0Jrwch+NuqapnkkVunqwH4aRHnpEeLBxsKzFJY0R
	ygIi5xwKDSwNckrPZccS7w1/2kHN0UZQ68SVYaH6QKVyWOD7qlKnDowtka0rXomwkW3nmRE5hf1
	4h9vEoCTVtpVTQBl3KS5NquzSVUDigcxtx8BYOZIJo8/EvT47B1sGM0JQYdaZllvpnh2nJrdco6
	RzX3bLdGeVKfuZLOT53xD9efxJwo29cB3SfVsQxmlxF+x9TIWcEe
X-Received: by 2002:a05:6000:4705:b0:48f:c4fb:6bb6 with SMTP id ffacd0b85a97d-4abb400bb83mr5164503f8f.12.1795173512177;
        Fri, 20 Nov 2026 03:18:32 -0800 (PST)
Received: from DESKTOP-OL07BOP.localdomain ([87.116.183.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm4985562f8f.3.2026.11.20.03.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:18:31 -0800 (PST)
From: nenkov2004@gmail.com
To: linux-raid@vger.kernel.org,
	yukuai@fygo.io,
	song@kernel.org
Cc: dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	magiclinan@didiglobal.com,
	xiao@kernel.org,
	neil@brown.name,
	agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	syzbot+8b22a0459202f76b4096@syzkaller.appspotmail.com,
	Hristos Nenkov <nenkov2004@gmail.com>
Subject: [PATCH v2 0/2] Fix recovery flags on failed RAID10 reshape
Date: Fri, 20 Nov 2026 12:17:55 +0100
Message-ID: <20261120111757.4705-1-nenkov2004@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4d13edef-f454-437b-8910-3a905697303e@fygo.io>
References: <4d13edef-f454-437b-8910-3a905697303e@fygo.io>
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

From: Hristos Nenkov <nenkov2004@gmail.com>

Hi Kuai,

Thanks for the review. This revision implements the ordering you
suggested. Patch 1 clears MD_RECOVERY_WAIT in dm-raid on all three
reshape setup errors. Patch 2 removes the recovery-word reset from
the RAID10 abort path.

Checks: checkpatch reported no errors or warnings for either diff.
Both affected kernel objects built in WSL. Five focused userspace
checks passed for the dm-raid flag handling. I did not run a
live-kernel reshape regression test.

I used OpenAI Codex to apply the review feedback, prepare the v2
changelog and run the checks above.

Changes in v2:
- Add the dm-raid error-path fix first, as suggested by Yu Kuai.
- Keep the original RAID10 change as the second patch.

Hristos Nenkov (2):
  dm raid: Clear MD_RECOVERY_WAIT on reshape setup failure
  md/raid10: Preserve recovery flags on reshape abort

 drivers/md/dm-raid.c | 10 +++++++---
 drivers/md/raid10.c  |  1 -
 2 files changed, 7 insertions(+), 4 deletions(-)


base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
