Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486104;
	b=WF/L65X1efL0zwQdLpzvQRxVWcO5P6Z/1bErNMszLRzZhyyIlLdpZpe0gzd00hj6oHDd
	 x0ZvXEoHTch+9zMxypTk8/5ie2J2Yibr8h24xcnpw/qR39u04t1+ddTLeGDmsess7xBgu
	 1RTiXRkuSyVvA/K0dsT0xAD/erTb/FOSmxJkgewX+jpkbSaROZfWbNvVYDtPMQSzMi+Z2
	 4t+hRRPTpKuSZPmWnnG1LHO9y2j0EWfQslj2pgKzBYlROK2/124ZB1ooDP2KXEuoo++2S
	 nYvt/1ZnjAngAgIwdGPh7+OlHrHhv+wler/onw0pT3Ty83lsaKqsQ3d1O7hW4iomLPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486104;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0AqVKsAtdki6JZs+byxSKnrQdzA51H0wzKx3ZaPefvc=;
	b=k4bT1NFQIRrMZIoVBjhNUF1O1ynN4JtjCcsNt0seIGkUu4qI7IMOrh4dD0xiyMgRABkX
	 FPAPJ8xfjHoAxXyoOnEFSSbVEKlkYE0wG+sYzQxZe9sqlJkuXGBaH5bvYo/C+uboSe/Ma
	 vZBAdr6bCU3IMpKbgMIc5FDChT3qUBGzKCPfb67bsb/5Lymg0PatKa9jU3IJcvi8uDzLl
	 GPJORE+cymPRNkaxpQhJXWt8rY5sQ3eiy5nHmskd1gywllQf3tgYApAdhAl6ViUevhWpx
	 3ykf8DQe1VS9BSmkoTz4A2+drEvuvUzhlzeVocuK7qO0ebhJEhTDvNp9TkET41z46QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ut1o4jiM;
	arc=none smtp.remote-ip=95.215.58.169
Received: from mta1.migadu.com (out-169.mta1.migadu.com [95.215.58.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A2F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84A2F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ut1o4jiM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IBL50e1Vg8pdC8zxUxK65YEfsAT24ECM54GeoK/ohd4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795486101; v=1; x=1796090901;
 b=ut1o4jiMuOx3ZVaV3U7yzS5Oy1dxpxwxL3H8yu9Wb6NBxcn7d4KYARI/6iFxmWrLjpNXsMRp
 30/i6aKlPolOd8rkgwNpLdMYgZpejUz0pg+B3MJ7rtSUSRjw9zJgXmgWRLSeFS6UaicD27fY2V/
 69yuU4e5VV/f2rT7aMs+LG/k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 55ec52b9cf4f09b8;
	Tue, 24 Nov 2026 02:08:21 +0000
X-Mizu-Trace-ID: 55ec52b9cf4f09b8
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] memcg: warn when memory cgroup IDs run out
Date: Mon, 23 Nov 2026 18:08:00 -0800
Message-ID: <20261124020800.2313930-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.1
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

Every memory cgroup gets a 16-bit private ID, so a host can have at most
65,535 of them at a time, counting dead ones. A dead memcg keeps its ID
as long as any swap slot still records it. On Meta hosts that create
many short-lived cgroups, dead cgroups held this way filled the whole ID
space. After that, every mkdir of a cgroup with the memory controller
failed with -EBUSY: systemd could not start units, and container setup
failed.

This was hard to see:

- Nothing is logged when the ID allocation fails. The only sign is
  -EBUSY from mkdir.
- Since commit 8290f45995f5 ("memcg: move memcg private ID refcount to
  objcg"), a dead memcg is freed even while swap still holds its ID. So
  nr_dying_subsys_memory in cgroup.stat can be 0 while the IDs run out.

Print a rate limited warning when the ID allocation fails because all
IDs are in use.

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 mm/memcontrol.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 84f4a8fd4d16..206c910cf3dc 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -4271,8 +4271,12 @@ static struct mem_cgroup *mem_cgroup_alloc(struct mem_cgroup *parent)
 
 	error = xa_alloc(&mem_cgroup_private_ids, &memcg->private_id, NULL,
 			 XA_LIMIT(1, MEM_CGROUP_ID_MAX), GFP_KERNEL);
-	if (error)
+	if (error) {
+		if (error == -EBUSY)
+			pr_warn_ratelimited("memcg: all %lu memory cgroup IDs are in use, cannot create a new memory cgroup\n",
+					    MEM_CGROUP_ID_MAX);
 		goto fail;
+	}
 	error = -ENOMEM;
 
 	memcg->vmstats = kzalloc_obj(struct memcg_vmstats, GFP_KERNEL_ACCOUNT);
-- 
2.53.1-Meta

