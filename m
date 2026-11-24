Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523166;
	b=E73FOklIXVM7fg9toGCjLuQ3OcqmyFXu6Zrr8HjHwJNiRj+/QZ4+ZQ7MS/s2zVRAKkmA
	 jhN5I41DxAC765OMLrEmsIHRsEqNcLznmnvNJoky0ZpxgHuQajTml/i5ilbljGsY8WRjp
	 Dcma7O1iJdM5taUPVO1SdQfwALrdjYQg/H3hJ90TP1jr2NuDO4D95/hVQ9Rp4BqE7sQh7
	 /6rx2HgBuW6EZ2E8uCOKIHbPRylZlLJt+cJ8nl5j4XOWBDGBTxq2XshqqbgaTXKexBHk/
	 SS92v11RP/gfQTTRtZmUoPD70m2kq0j0BxKbkJkm788URFqeqkGXvj0EPpGt0M30qrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T9Uv2op32zHohJupS53Sf7SqghzNQXe+QDtOgKlIHmA=;
	b=1S3w+G0RY84CQ1kglx9A6PuzNmXOTjqZmFPkfU4vXcbAuVkVGZDJoMOpH3CE1pGZ1DoZ
	 M+ZcHS+0GGruw5EHXy3BCK/so8tNidtwfNN5iX3PHo8eRS2kDECNYzVOAfPXC3nVc63dt
	 MZxs+1LEf4kwQQdCZvV4bQluvbYfHrfWs5V3czd51nIJVOKB+ZufRJnAZucPSZCCoh6g1
	 QhoVQ70uAv7BM9vT5/V1LPYhG616pyF1IWlNr/wCKQzsUXf/tog5xwgRVhFLFVKLR9vUa
	 A3FkXSM3Aafu9jpIDnJx338hu1VM8pSeniLMmowD16BlnWb+r7KAIRepwC0nCb4xAQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvz.org;
	spf=pass smtp.mailfrom=openvz.org;
	dkim=pass header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=ZkCib3vL;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5182606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5182606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=ZkCib3vL
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so35388005e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvz.org; s=google; t=1795523164; x=1796127964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T9Uv2op32zHohJupS53Sf7SqghzNQXe+QDtOgKlIHmA=;
        b=ZkCib3vLn5L1FYGdyVl8yaG6OI7H1M3kncwKfQc78DB+MB++hygyoxJebab7CsTe/Z
         S5xMOOQY3TskXBnkZMosBudb9MVr/SYlzQQ+zOLAbX1Sloxl4+pnw8JI6xFkV1BMGO0g
         gJoHPEjjs79dVtAYxnQ2n/N/+4F8P39wqEWNK83m5Z5fVud/QDU9U0pZSYTXyZIZYcoN
         33YOlhISn+k8OJBCWSt/KVBE7q6RJzxE3cChjiKxRaptLtTSskulVKwxoXmqAHdgnDqM
         FFQNuPuz3ycD6ZubfOV7JAgqBdi4T0kadTHfzK4DPfZPnY3/7GhsatjjHy3YjxLO7PPE
         8FxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523164; x=1796127964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9Uv2op32zHohJupS53Sf7SqghzNQXe+QDtOgKlIHmA=;
        b=QTNeyHc7dYY0rVBGVGc4SHghcXGfmWk1ZxfX0VS821wpyV7PshXQSvNT4cf3SfTETv
         sjmEd7yoBShXWr34cah2BTILJAx8RiBwK9WGxVSni4tsojr3Tn9uWIMCT7ZFII3xB0Af
         4CjM++FRdHINLxSILuoTgr5BN0dpI+Ktrx6L9GMim20wA9G3Zzv8Wk4P3pkpqgWJHd/D
         a5Ve+6zu1SBjZOJQgi5ibcDsWCAC1OKeXxI09ssIH3pNnxLFgDBsj/jm4GcARywYQ/fg
         ZjBtvuXea8MmVm34Nqw6WbyRmF/NOAirCoTVedlDrCofG9XBzvnOa8ycBRwHN67Gtm0N
         d5IQ==
X-Forwarded-Encrypted: i=1; AL+hErHunD7in0I1C2nzm4prV5boukYIrgY3Qzad230nsOjWgNwIEeApRuiamqKMe0Jx6m1+NWqMiLJx8HBC2q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kE5Bs5V1/wIqCcD47d0F5jUXzD0AZJSE6N5ouVP4hcxRBI6lt
	dQcAwMss1fyMH5NFCFFNX+uEFYRVoeOjfGM+OMvsKU0HEwqKwmGdErdmmjtt9+5yozE=
X-Gm-Gg: AZFdTZcHdZA6uC+F9MAmG3TMNky08CqEgXwxYwsi52fh9TCSeC1XfrFgKB3+GKWI2sN
	bj/cfy9rOROdmRR+9gOpqtiPRjbo4+KGiF0384uEacLfN2D0AW6lPqjGRrCX7ptLj5tFJ5W99Me
	2WsQy/zFw5NojPzgYAyMAhM/8R0GBCV7n6COmZHRoVEySbu6R0g4AN3+23ys6+bJLnFGLliYilw
	8/tSdVF0GhKYs8A8qhLz76F8lmB7WcKr4q4zCPYI5V3dfjmzfnc3RCSjU5VvgMCdt9ZDCc0MfYR
	Pbm56anfMgH9ADT5JQ1I2n5VdSg/a3laeVQmq4odK2fYxfwG6ra/VfOBwTU577uDQtIxbByWRUv
	yCHMXrycpguplIrFnC7pO3P7hq7Tzt3xD+AzRDv3yh5PmowrAkG6e3IJHa4uLxgc2khNnNDgYRo
	Xvh2RTusIIT9o0eSQKxE2LIyU04qdELy5p69Q9gH29/y78cxkgwj9xGmaORl2W1U7/F9UQcf8cZ
	cbMUHz2aZgsSz4snmA3yw4VDISITKg3s586pTGsNzys1l6qNMIG16Rxi/YsMki1k4hjM+FGNSwS
	iEGmrEn0acmoz6PFSAYZ7fmr5L0=
X-Received: by 2002:a05:600c:46d0:b0:4bb:8711:fee8 with SMTP id 5b1f17b1804b1-4bb8881894amr289262115e9.20.1795523163953;
        Tue, 24 Nov 2026 04:26:03 -0800 (PST)
Received: from artemis.sw.ru ([2a06:5b06:b600:300:8dcd:31dc:bf64:9564])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm423615975e9.15.2026.11.24.04.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:26:03 -0800 (PST)
From: "Denis V. Lunev" <den@openvz.org>
To: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	dm-devel@lists.linux.dev
Cc: bmarzins@redhat.com,
	thornber@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	den@openvz.org
Subject: [PATCH v2 0/3] dm era: a metadata device that never comes back
Date: Tue, 24 Nov 2026 13:25:58 +0100
Message-ID: <20261124122601.436965-1-den@openvz.org>
X-Mailer: git-send-email 2.55.0
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

We move running containers between machines without restarting them,
and their block volumes travel with them, so dm-era tells us which
blocks changed between copy passes.

About one move in three ended with the volume dead rather than moved:
the metadata broke, every commit after it failed, the target reported
"era Error", and the writes it tracked began to fail, which takes the
workload's filesystem read-only. Rebuilding the device recovers the
tracking, not the filesystem.

Three unrelated causes, all of which the kernel log blames on the
space map, which is the victim. Two need no bad luck: multipathd asks
every target that appears for its status, so one is asked exactly
while it resumes, and again while it suspends. The third is older and
wider - a transient read failure in the persistent-data library leaves
the space map short, and the next commit makes that permanent. dm-thin
and dm-cache reach it too, where it costs a transaction rather than the
device, because they can abort and dm-era cannot.

Each patch is reproduced on a kernel whose only modification is the fix
under test. Patch 3 must not be backported before patch 2, nor before
cca2c6aebe86, where the resize goes through the worker the two would
refuse.

v1: https://lore.kernel.org/dm-devel/20261118110239.2910290-1-den@openvz.org/

Changes since v1:

 - patch 1 no longer moves the decrement past the copy. Holding the
   copy's write lock across dm_sm_dec_block() raises the number of
   blocks one task holds, because the decrement starts by shadowing a
   bitmap block of its own, and the targets size their dm-bufio reserve
   for the peak without that. The reference is put back on the paths
   that fail instead, which leaves the order, and the peak, as they
   were. Reported by the Sashiko AI review.
 - patch 1 no longer releases the block allocated for the copy. That
   block is leaked on the error paths, as it was before the patch, but
   releasing it is wrong while the space map is in bootstrap mode,
   where blocks are handed out without a count to decrement.

Denis V. Lunev (3):
  dm persistent data: put back the reference a failed shadow dropped
  dm era: refuse metadata rpcs once the target is suspended
  dm era: construct the target suspended

 drivers/md/dm-era-target.c                          | 10 +++++++++-
 drivers/md/persistent-data/dm-transaction-manager.c |  9 +++++++--
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.55.0

