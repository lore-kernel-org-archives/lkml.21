Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437966;
	b=XU8jCPIeTGTIwwrqDtLZOIsj9y4TrGQ8s6W3Iul3nl4xTjHHSUHuSV15O0wVlVZy0fpe
	 41EK47W5X3+ixfU7eeEq7960oZ8MC+V70Pikdt41PIX81FOX4JEMWG0sKX4IijSF9+7eF
	 XT1/0wkoZaJEEo+CqkxM+9a/Bzx9swzSn3v9XmcTC50qaT7NUHLfoDOOz4d5VveYIzKor
	 FgVy7ssGdZmoxyV5Q/IMX88JcfZQ0/08hT55LoLEejoBBF076nQm3cUevd3fc4UtHPmtX
	 +4vaHEjZrTyOZU/s+2SGjNTdLut6MrPhuiu6oe+ESkmnCj9sL13J6p81BEAPcBaS7kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437966;
	h=DMARC-Filter:DKIM-Signature:Cc:From:Content-Transfer-Encoding:
	 Content-Type:To:Subject:Message-Id:X-Original-From:X-Lms-Return-Path:
	 Date:Mime-Version:X-Mailer;
	bh=f52SNuh4fVTxkpx9eifPGKQ42yXiymJUGBpuYwvUaEA=;
	b=HvxkMHMxwNVQPHHiyk3Ij6QwJKKWrnXTDv2xF1Rvf5ULwr2JHQO9eaO9LM8+7W57F2g5
	 C9MEZ1qLMLnIhlXvTl5LltAsDH7VNNQWIVkxIW8mHwWJpih1drQG99Qksq+HPIUSmuCDB
	 P8B4OmCb0pJkaVdnEkgMKhmx/f/0/H3607M8kLsEl93OfoV1chp4+Pan7lCeNKUiQloVX
	 V9VT+VwyJkx16MOHNHBSA+Pn7PUvLlV3G+c0Xy/uZpP5JixydRitmejj25VwDeXsCWUv6
	 WOSsew+nrFcFlvbWxJUrLdEcx10EwoI69OU105z5K2BaOwoYG0UI6jOgaG6+In/10zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b="cL8oKkS/";
	arc=none smtp.remote-ip=209.127.231.113
Received: from va-2-113.ptr.blmpb.com (va-2-113.ptr.blmpb.com [209.127.231.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615F2606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 615F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=cL8oKkS/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1795437955; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=f52SNuh4fVTxkpx9eifPGKQ42yXiymJUGBpuYwvUaEA=;
 b=cL8oKkS/U2uX9h8qdhXf+n0Oa5lF39kySatoKKuN/md/D/XaXf/H8UoLDVEmIozeizwGMc
 3ZLr1BM4ksRZyokaFaNidqdHnQEeizMGPZjp5eqY6ibYPpmG9FC1f/paAy5Ne5KmLKwGcb
 nNXDQvSCBk+/ZxoEM249jpWHlOJmQ0Mt2vmYz1SO6g2et3j7a8QPaJOiykIkcEoFZZCSvv
 gRvwb3i3c/Ou7kLZ83oIpf9n3C9NGP/q33l0g9RBZZyraXaQlzS4Lx593ySLS2cktmTjvQ
 HOzTp8KnJn7A0avtgHEARXS0LiXZ5EMk+2teLBGL4UfjKI/oNVMD6CZVc/MGeQ==
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
To: <longman@redhat.com>, <tj@kernel.org>, <hannes@cmpxchg.org>, 
	<mkoutny@suse.com>, <ridong.chen@linux.dev>
Subject: [PATCH 0/3] cgroup/cpuset: Speed up v2 mask updates and domain rebuilds
Message-Id: <cover.1795436486.git.zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
X-Lms-Return-Path: <lba+26b043581+bf4e8e+vger.kernel.org+zhouchuyi@bytedance.com>
Date: Mon, 23 Nov 2026 20:45:21 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1

We run high-density container workloads on large bare-metal hosts using
cgroup v2. We may configure many root partitions on a single host.

Changing a member's cpuset.cpus scans its siblings under cpuset_mutex,
so the cost of a write grows with the number of children under the same
parent. Creating or resizing a root partition can trigger a scheduling
domain rebuild. The rebuild checks every pair of partition CPU masks for
overlap, so the number of checks grows quadratically with the number of
partitions.

This series speeds up cpuset.cpus updates and scheduling domain rebuilds
on these hosts. The timings below are from a dual-socket Xeon Platinum
8582C with 240 online CPUs.

1. All v2 partitions use the default scheduling domain attributes.
   Passing NULL saves one array allocation per rebuild and one attribute
   initialization per partition.

2. Check each partition's effective CPUs against the union of the masks
   already seen to detect overlap in a single pass. With 128 root
   partitions, median time in generate_sched_domains() fell from 42.9 us
   to 3.14 us.

3. Skip the sibling scan when a member's cpuset.cpus.exclusive stays
   empty. With 2,048 children under one parent and one sleeping task in
   the target cpuset, median write latency for cpuset.cpus fell from
   24.1 us to 0.85 us.

Thanks,
Chuyi

Chuyi Zhou (3):
  cgroup/cpuset: Skip the sched domain attribute allocation on v2
  cgroup/cpuset: Check v2 partition overlap in a single pass
  cgroup/cpuset: Skip sibling checks for v2 members without exclusive
    CPUs

 kernel/cgroup/cpuset-internal.h |  1 -
 kernel/cgroup/cpuset.c          | 74 +++++++++++++++++----------------
 2 files changed, 39 insertions(+), 36 deletions(-)


base-commit: a6ca40399708c4322e87448f6c47da7192d72895
-- 
2.20.1
