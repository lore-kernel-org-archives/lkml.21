Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795492947;
	b=s+kWrrqQ+tPelEOLvt2/ht4EMNCuzxbpIaXdZTbNWsVXQoXNPYAIJU+fWTRvR8EU0WfI
	 buvWrQDuy3IBIZowqHlAH/OXiA8bEq90TQr8M/F20zAKPYdzVnQAUkZ5yPrHIfGV7kAQI
	 db4DEdAm4hWFlF/29UHNsQqvmw5kivGPFXAX5TbVHQCTKNsaKH8yxb3zimjQr5hfAFNHr
	 MFpJ+6IMvZbd84X1vOZUQWZUn8CbHetl5s42WXK1bSEvNs8UrAEnyvDqJrgKl8pAK1sxJ
	 VjaemP62IOtnLzDYSrUHSttPo52UrE8lLoKXiX1W9Oh9ibTjxrPc6+SvZt4E64MHyUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TQU/HIX5TEt1B81IWYObhBXBEJngh0gUw6npxUDBNUE=;
	b=VuCxsvTnV341gRIhWBdUBuEBr9liofQ4yoq8rUAbJB2AhJoVuPKez89aD8fv5M5YD+YU
	 LEnix4THCpMcUXhBY5L6qc6zi82qw7PfXbcW5fAIlHV+n3Tuc9MiAomElALghiqMK0JzL
	 M1bSeUZlFBKBf5weqgZhvJAoBaUvtzgleO92FwsPlNFrqtbklVr3uy6A5Bhp2hU/3KECO
	 OgeSvUZMG3zZXHPXYTpWlH+OBQLh371wEVF3I1IMWuKJ1aaS1vJWBkgdlC0arI7TBH1o3
	 HDxOeaPlCF4IOdvcA5TK2Xh1VMvXSdrXcuwxEQn7Ix1R1ABNlCqXVQHF7cO/O/JhpcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z8Jvq/NB";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CA9606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1CA9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8Jvq/NB
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f03eeda984so21520835ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795492946; x=1796097746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TQU/HIX5TEt1B81IWYObhBXBEJngh0gUw6npxUDBNUE=;
        b=Z8Jvq/NBdpYzCcne54+bFLSc517CjxZ8f9t/fxqRS4JaXg1NvBCT0lg7/BGRehku8Y
         57oMa5SJRygDDspteLr3UBXE94RD566Z2pjCmZJxt5QUWzMDC12VpWP2In1SwlGRkwfm
         gbhE3KHFKBbX4552yTA6I3BGFDUD5eNQbV7xpsETTFJeSWcxcZ+ErLhj6WPKREHQgTpA
         tvth68v7isiJXWeGiMDdn56TEuNvAd+nYwEym+lXdzyNB/WMVfLydX8ZfXyE7DccglnP
         /iZyDz5V8P/CjH85wA621E2lFK+yfTPXkGlmnxAJgTrawc6XB79J0BWZYpYPgZGLo/tk
         WKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795492946; x=1796097746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQU/HIX5TEt1B81IWYObhBXBEJngh0gUw6npxUDBNUE=;
        b=Q/TOqc/gBkurblaMXWZAA/tMXJiBZlENY2HibxisNkkfpSRo0ViiMtgA63xKpkMStE
         svCG63uMNIIZS0u6CnA0kuap9Z7lLX/xdCxhHsyaHwX0Rkf3QfPL79aCgOcULwTcSapf
         IVi9yyipVhz0G4NVU1yOql2/iFgx03axE2Tza7zGUs0DQlpwUc4ldX8SiYs4OS/7cmD0
         jvs9VmpnuQMS/6xyw5QQaMaH0Jq/FFXtJOSVnijopbDAj3P2Ai5DntIiQsoYjM27tlHW
         EO+Z8aOtqL7jkzdiXxbVCNXHbLNgKg2/6qYrW3aoVyjobBBY+RsWkBWLvMrb9n2n85+u
         8oow==
X-Forwarded-Encrypted: i=1; AL+hErFSL9HMVvtDLKsMJARDOq+HD7a0HDnhfsQh7lA8gUZVU8p0eRUAQnSYagy+ROekUcfzRWUShPO9ASaKgFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DGh6uauAmUNwReuhV1crmdv6mkyQIP9ibzBRX8Gje6JbrR3WZ
	x7VNgAf3J/pIBT5h5YlR19+9rps8fdzlFkwMMspk6b9fSdcvjLNQmZfW
X-Gm-Gg: AZFdTZeiH2bRgitxSo0adO7E0s5SBfrbzwt3c9NS6uWIp1UfwFifsUPVrsxvHMi+Q/2
	Ie9l/DCen8flQ34thjjCYEoB7FoXgP4E4Yl5DCojzo8kOrjJqzfHdGJVjfuU+jFzCeAHjFCP7Vi
	xFuby9lUWop+E+UoVkXEqMKv4lB5Nx6OD6h66xlW02vBiAa2tsoWYe0gp8zyVWUy7L4rnWLaNFS
	NgNxTpLI/G1isA5Uf+aaCxjkOv+GSSxZFX1+HivDFkDTfUOmt3hwn9+THZhcZ+v0Fb/9H/w2IbA
	Hz0MO4T7+Mu3NoBTYdYUpaWco0VtMmxGvi6KZtCzjL4kCmJRSVZWnRoNM4i71hZZnjKgeRnXVk8
	CgkhJH5Mt3YI03EyFQXT6jqNHDN6EWGRsQzKWIaf/BPuBfy5lsRlbY7AO6ucwfTugJ/zxNpxYyB
	974Yiaj98rXE/PPKmaBKkKfiM5dcF0Os5HCCWUr3ElLN7BpHkWb6Yi6f6wlGo4rVVKBinx36PMd
	SNA0maA97huuhpegkxgk8EBH/Q3/efcfHigM8l2rqsUZV1IihvoZL1eULWy/JZ+CTbg+PKsEtEW
	C6NvlCYXqZ4+emNc9OKwQZmaq29chrzPSR0y/1NN50u77KTqpbgpgS+ZyqW7FNglbobBR5tPIA=
	=
X-Received: by 2002:a17:903:40d1:b0:2f0:b599:8c98 with SMTP id d9443c01a7336-2f0b5998f1emr21408035ad.42.1795492946134;
        Mon, 23 Nov 2026 20:02:26 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([43.132.141.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f08164dacbsm33115955ad.68.2026.11.23.20.02.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:02:25 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	paolo.valente@unimore.it,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH v2 net] net/sched: sch_qfq: bound backward slot rotation
Date: Tue, 24 Nov 2026 12:01:43 +0800
Message-ID: <20261124040208.13282-1-ljp1205831794@gmail.com>
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

From: Lin Jiapeng <jiapenglin@tencent.com>

QFQ+ keeps aggregates in timestamp-ordered slots and rotates the
occupied-slot bitmap when a group's start time decreases, avoiding the
need to move the aggregates themselves. Insertions are capped so that
occupied slots leave room for a later backward adjustment.

A stale aggregate can make the decrease larger than the slots can
represent. Rotation can then drop occupied bits or alias distinct logical
slots onto one physical hlist, and a later removal can clear bits in the
following slot-list pointers or leave stale bits. KASAN reports a
slab-use-after-free read of size 8 in qfq_choose_next_agg+0xd04/0xd90 by
task repro/92 after the corrupted group is selected, followed by a panic.

Limit backward rotation using the highest occupied bit so every occupied
offset remains below QFQ_MAX_SLOTS. If the decrease exceeds that limit,
move the activating aggregate's S/F and rounded start time forward by the
same slot-aligned delta before rotating. This preserves its service
interval and the logical-to-physical slot mapping, including repeated
rotations, while leaving representable rotations unchanged.

Fixes: 462dbc9101ac ("pkt_sched: QFQ Plus: fair-queueing service at DRR cost")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Link: https://lore.kernel.org/all/20261116121710.77403-1-ljp1205831794@gmail.com/
Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
---
v2:
 - Derive the backward rotation limit from the highest occupied slot.
 - Keep occupied offsets below QFQ_MAX_SLOTS to prevent hlist aliasing.
 - Update the insertion and rotation comments.

v1: https://lore.kernel.org/all/20261116121710.77403-1-ljp1205831794@gmail.com/

 net/sched/sch_qfq.c |   23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/net/sched/sch_qfq.c b/net/sched/sch_qfq.c
index e900890e9c54..3e2b40bea668 100644
--- a/net/sched/sch_qfq.c
+++ b/net/sched/sch_qfq.c
@@ -843,9 +843,9 @@ static void qfq_make_eligible(struct qfq_sched *q)
  * The index of the slot in which the input aggregate agg is to be
  * inserted must not be higher than QFQ_MAX_SLOTS-2. There is a '-2'
  * and not a '-1' because the start time of the group may be moved
- * backward by one slot after the aggregate has been inserted, and
- * this would cause non-empty slots to be right-shifted by one
- * position.
+ * backward after the aggregate has been inserted, and this would cause
+ * non-empty slots to be right-shifted. Backward rotation is separately
+ * bounded so that every occupied slot stays below QFQ_MAX_SLOTS.
  *
  * QFQ+ fully satisfies this bound to the slot index if the parameters
  * of the classes are not changed dynamically, and if QFQ+ never
@@ -965,7 +965,8 @@ static struct qfq_aggregate *qfq_slot_scan(struct qfq_group *grp)
  * because we use ffs() to find the first non-empty slot.
  * This covers decreases in the group's start time, but what about
  * increases of the start time ?
- * Here too we should make sure that i is less than 32
+ * The caller keeps every occupied slot below QFQ_MAX_SLOTS after the
+ * shift, preserving the one-to-one mapping between bits and bucket lists.
  */
 static void qfq_slot_rotate(struct qfq_group *grp, u64 roundedS)
 {
@@ -1300,7 +1301,8 @@ static int qfq_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 static void qfq_schedule_agg(struct qfq_sched *q, struct qfq_aggregate *agg)
 {
 	struct qfq_group *grp = agg->grp;
-	u64 roundedS;
+	u64 roundedS, slot;
+	unsigned int max_back;
 	int s;
 
 	roundedS = qfq_round_down(agg->S, grp->slot_shift);
@@ -1318,6 +1320,17 @@ static void qfq_schedule_agg(struct qfq_sched *q, struct qfq_aggregate *agg)
 		if (!qfq_gt(grp->S, agg->S))
 			goto skip_update;
 
+		slot = (grp->S - roundedS) >> grp->slot_shift;
+		max_back = QFQ_MAX_SLOTS - 1 - __fls(grp->full_slots);
+		if (unlikely(slot > max_back)) {
+			u64 deltaS = grp->S - roundedS -
+				((u64)max_back << grp->slot_shift);
+
+			agg->S += deltaS;
+			agg->F += deltaS;
+			roundedS += deltaS;
+		}
+
 		/* create a slot for this agg->S */
 		qfq_slot_rotate(grp, roundedS);
 		/* group was surely ineligible, remove */
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.55.0
