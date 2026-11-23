Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437988;
	b=Gbti1IliHxITkehDYupcIG6IK7acCoJF6J7Hu53zmEYyD+6JqqepT/P7t91ZCj2bidqr
	 5c6XeF9sDFzs5PO10BFt1IAxLES552YgmtFhR5zg4sxe7+w40Bss0cTHhDi+fTJ0ZDWbH
	 iXZjBInhFduOak8lQ+8j+gfx57UBsiNP03TgAi2GiARUWx7OwhgC+FpptpZEGwtxF1wp6
	 W1K8Dc/5vcvuwVzTWvFTSYEj/rl4jzsq2BVq5psR/IGcR0xCqV8rQucr84VfeDY0WZb2a
	 O48WbJ3COAKJZ90FVgiYAc+LQMnQbQNgzl43huSsMsD4y/u/6ZKaNnvQ6cf5rFh8BXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437988;
	h=DMARC-Filter:DKIM-Signature:To:Cc:References:Message-Id:
	 X-Original-From:Content-Transfer-Encoding:From:Subject:Date:
	 Mime-Version:Content-Type:In-Reply-To:X-Mailer:X-Lms-Return-Path;
	bh=Ijzdl6nn64ByQAhWwXzBK9XVpKuXpkq+kJEXLsAiw4M=;
	b=ipsQ3fzze1/bcXCxb3G1zFT3GbFf5kiqBuv3m0q4CvQlKnbjO+e5CwwMWoVrKmOOVlA4
	 eeqdRL8dcXRE9vK27cE5y/gpZDnaUrh9LxEcpjpcnaZiRVeyblHbFljno+UiQ1tMrKz8A
	 FiHKTBISGZXj890xFoPIUNCr53jMa6Dn7EphOp1DcOMZEjkKYLa+esDSTfXeOF9tw9T9N
	 PNIQmxlg6KJjQpUd6LSsv6SnQOtIAeGVkmOz8hIhq+sV7QQfyHyHHc8/Fu1LoZQEOyBpF
	 j3TTq5NhXw9RNiWEXJd8UwINYQSUbkgK9j+UuDsBB+lpSo5sR/cy9urvJUs/HRzyTpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=RwZIr8VG;
	arc=none smtp.remote-ip=209.127.231.112
Received: from va-2-112.ptr.blmpb.com (va-2-112.ptr.blmpb.com [209.127.231.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4532E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4532E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=RwZIr8VG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1795437982; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Ijzdl6nn64ByQAhWwXzBK9XVpKuXpkq+kJEXLsAiw4M=;
 b=RwZIr8VGe836YC8avPVnLQXZCff6SNlCyRGWaBBmT5viUzspg0wAB49UPRPIqBx/tif+zT
 j7rXssBw9dCJUTXWUjhus6+sS3+aWC6JoZscuTT8fcoAX5cQXsii/hT2qHAChyWaF0JxCi
 XxZuOsw7/YNvVLqYO+GmFFLApLm37jSMQnM1HMnWDn64/YAoml+VRjx19Qrj+sZ8izX+QV
 /jheaCU/mnR6pSYHvCYrpH7R3kXpkLkmpHv0pWc2Sw/piY7rPmyS+e1uJWBExr+ht8VWxE
 27JzCcBwZpe6cikTMY+E9b0svTxwO1XIiwmd2uNdLHnv327GNzp3gQpCSMVPBg==
To: <longman@redhat.com>, <tj@kernel.org>, <hannes@cmpxchg.org>, 
	<mkoutny@suse.com>, <ridong.chen@linux.dev>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
References: <cover.1795436486.git.zhouchuyi@bytedance.com>
Message-Id: <f4cec0e13d65fd60c6345dd63c2db1f5138bf532.1795436486.git.zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH 3/3] cgroup/cpuset: Skip sibling checks for v2 members without exclusive CPUs
Date: Mon, 23 Nov 2026 20:45:24 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <cover.1795436486.git.zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Lms-Return-Path: <lba+26b04359c+1a9699+vger.kernel.org+zhouchuyi@bytedance.com>

Changing cpuset.cpus on a cgroup v2 member calls validate_change(),
which walks all siblings under cpuset_mutex to check CPU and memory
exclusivity. The cost of changing one member's CPU mask grows with
the number of children under its parent.

Skip the walk when the member's cpuset.cpus.exclusive stays empty.
An empty exclusive mask cannot intersect a sibling's exclusive mask.
The check for a sibling whose allowed CPUs are all in the member's
exclusive mask applies only when that mask changes. Only the top
cpuset is memory-exclusive on v2, so the walk can also be skipped
when changing cpuset.mems on these members.

On a dual-socket Xeon Platinum 8582C with 240 online CPUs, the target
cpuset contained one sleeping task. A writer pinned to CPU 1 alternated
its cpuset.cpus between 2 and 2-3. Each table entry gives the median
latency of 256 write() calls.

    Children    Before (ns)    After (ns)
           1            861           859
          64           1425           856
         512           5184           855
        2048          24056           853

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 kernel/cgroup/cpuset.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 2e09abb9e864..6c47cdb4a244 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -804,12 +804,21 @@ int validate_change(struct cpuset *cur, struct cpuset *trial)
 	    !cpuset_cpumask_can_shrink(cur->effective_cpus, user_xcpus(trial)))
 		goto out;
 
+	xcpus_changed = !cpumask_equal(cur->exclusive_cpus, trial->exclusive_cpus);
+
+	/*
+	 * On v2 an unchanged, empty exclusive CPU mask cannot conflict with
+	 * a sibling's CPU masks. Only the top cpuset is memory-exclusive.
+	 */
+	if (cpuset_v2() && cs_is_member(cur) && !xcpus_changed &&
+	    cpumask_empty(trial->exclusive_cpus))
+		goto valid;
+
 	/*
 	 * If either I or some sibling (!= me) is exclusive, we can't
 	 * overlap. exclusive_cpus cannot overlap with each other if set.
 	 */
 	ret = -EINVAL;
-	xcpus_changed = !cpumask_equal(cur->exclusive_cpus, trial->exclusive_cpus);
 	cpuset_for_each_child(c, css, par) {
 		if (c == cur)
 			continue;
@@ -819,6 +828,7 @@ int validate_change(struct cpuset *cur, struct cpuset *trial)
 			goto out;
 	}
 
+valid:
 	ret = 0;
 out:
 	rcu_read_unlock();
-- 
2.20.1
