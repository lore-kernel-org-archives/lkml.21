Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672342;
	b=I3K4/5h3MXo5LYRQYFJ+Zh+acXNSnovN0eDkWautI74+lSxgoeIn4dBYL5Hn0KuP/Dwq
	 dDPkRXSb8L1xzgGXGmz6WSYXuckU+51EtPUUsZRUlIwyvuDn7H2/LqQO43t/WoO69E6IY
	 6WfLVffW5AxT1JpOVy3vBEsFQhrZTypdkFJMr669m7KADdmigB00GtFq1cS/+3pdI/kBr
	 Gd19Ne5HVhxhj70UfrJdRfZuBlscjll/4/CHYHpjVG1FoLE62r6T/NNFWybGF51hO14xD
	 81zi0UUz+fjVNvxX87g1IVIpAWHq7nc9FcvD/LH/YY7MVW4dc2A4rrxO7VLgKdyqwIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672342;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1mD25X2vM0tKSpsk0hOa7lL0V+yBHv3uETp5MwJ8n3g=;
	b=oVJSHyioQQvEAghFPnGuJA7hXzglBy8szrvT8J8xchlAPzMErfKQS4MfYyp8SRIF9+9c
	 3IaKQKO5b2IUOAs9slABAoA/3Ecc5JVRJwZ+SsJKdWbaByduHnAohTa0vU7apvF5OnJaK
	 iWw5jtOKmvQcV/HRkP4CBPguMkNenBYg4tnASTS7MR3LltKWZpO6jn6KLItF+grBa9c+v
	 LbSs+Eib/8Qq7lmYLWXk6wq83DzSFaKEEHm7FW4JEE5fHr4/0NUpRZ1/cQLTyk7CNI+do
	 rVeLgFDP+2ZQdi5UwoeYQ7H3cq+Q66SooE/nYtJDGyMbyKejnK6jd31Yw8CfKDNBQVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SR05x8JL;
	arc=none smtp.remote-ip=91.218.175.46
Received: from mta0.migadu.com (out-46.mta0.migadu.com [91.218.175.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1D7606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C1D7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SR05x8JL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DWd0xhelk2YFIhRVZofJlpgweZVvr/fdjF5GhP3nCXY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795672339; v=1; x=1796277139;
 b=SR05x8JLlMUYK7jnKWuLlxCA4kD34Om/t10MxvLDUxvbZnHEc89VTHBj+vWur2/+G1kw8KKY
 R1mKZKnGCfOX4xnCAybMFM3ODtCW42jYsD/rnOjgwDElYIvX74vx0gn7Xs4O0yrAs6kdyhsSoCt
 9Hoax+56vdtg/vTPtZcR9AQs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 85f3c92f703aec8b;
	Thu, 26 Nov 2026 05:52:19 +0000
X-Mizu-Trace-ID: 85f3c92f703aec8b
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com,
	tj@kernel.org,
	corbet@lwn.net
Cc: ridong.chen@linux.dev,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH 0/2] docs: cgroup: Clarify cpuset CPU isolation
Date: Thu, 26 Nov 2026 13:52:04 +0800
Message-ID: <20261126055206.251724-1-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
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

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

The cpuset documentation has an incorrect description of boot-time
domain isolation and does not describe the housekeeping CPU requirement
for isolated partitions when full dynticks is enabled.

Patch 1 corrects the cgroup v1 description of isolcpus= and removes a
reference to the nonexistent cpuset.isolcpus file. Patch 2 documents
which CPUs must remain available for housekeeping in cgroup v2.

Guopeng Zhang (2):
  docs: cgroup-v1: Fix the isolcpus description
  docs: cgroup-v2: Document the housekeeping CPU requirement

 Documentation/admin-guide/cgroup-v1/cpusets.rst | 15 ++++++++-------
 Documentation/admin-guide/cgroup-v2.rst         |  7 +++++++
 2 files changed, 15 insertions(+), 7 deletions(-)

-- 
2.43.0

