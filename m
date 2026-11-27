Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.0.225.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746687;
	b=HnJAL9HS1TcRUYtjq8IadkXcPa4pd/9X8m1Gm09dyinytJainGv33jYk32Kk7QFvj0sU
	 K50rz3uBygAPPNPBMJNFYmsk8DOr+/tVtD0TDoM+bP8zb/yVfDDcW+O4TizUkOSM8Ui/X
	 M8iEPQuYJi9U8l+hXR6hG1F4iwCBigZ3OkSDHFLH+orDmRqpHORgbWcdLbZ23XMQLqJx2
	 fzQFobwY5CsW/YPtqjcK7uo8SMsyl616z2s7eLfjewr9wYetoglgqmvCA3eyCGX0k78wZ
	 rRIuMZkA1QYkjG3ZylfmdCrXbTi8FMJ8a7u/FP4jbpZfx3pn7xtwZ3HZN16WOnZ0cUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746687;
	h=DMARC-Filter:Received:Received:Received:X-Eyou-Smtpauth:
	 X-Eyou-EnvelopeSender:X-Eyou-From:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Eyou-Sender;
	bh=dA87UcbQhmaj2fqLijX+wxuez2/12e/CLRHVZbI7N7w=;
	b=XSMiYcWlwSpuNDSbwXnpxOYSJoBoYx6phyx5FW+Lg5GjDG8thkpcG7VfqeJROjU0PWdd
	 MH9IRHjDUMoPeSVlTvIHSnJBpBoeUpmY/2OB+8HJa+27jeALb4kqx5nGtuR20Q/LQoqfL
	 g10htnwe0NOA/OdnbVZv2rQlxN1cJCmOVeXezFuhWqrSGaS2k6n8f9zSYngpqA9TUWtOI
	 DkdFoT784gJy7st2DnolawMw65c2+maDkX9VdMg9t/gYPVOpTArty6CCzcHV/dgSFuhRn
	 qhgs15R4e7rxoAhIcyshj4yWuMrutVGJEX+BBXuxmErI9c+n6+dIprZP/T1tGLfOPJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zhaoxin.com;
	spf=pass smtp.mailfrom=zhaoxin.com;
	arc=none smtp.remote-ip=210.0.225.12
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B02606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B02606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
Received: from zhaoxin.com (unknown [127.0.0.1])
	by mx1.zhaoxin.com (MTA) with ESMTP id 4jbHTw60QbzbKS9L;
	Fri, 27 Nov 2026 10:31:16 +0800 (CST)
Received: from zhaoxin.com (unknown [10.28.140.201])
	by mx1.zhaoxin.com (MTA) with ESMTP id 4jbHTt5PwvzbKS9L;
	Fri, 27 Nov 2026 10:31:14 +0800 (CST)
Received: from zjh-os.zhaoxin.com (zjh-os.zhaoxin.com [10.28.44.129])
	by zhaoxin.com (8.30) with ESMTP4db20fd4ad44ca33462eecd045475130
	Fri, 27 Nov 2026 10:31:15 +0800
X-Eyou-Smtpauth: jonaszhou-oc@zhaoxin.com
X-Eyou-EnvelopeSender: jonaszhou-oc@zhaoxin.com
X-Eyou-From: jonaszhou-oc@zhaoxin.com
From: "=?UTF-8?B?Sm9uYXNaaG91LW9j?=" <jonaszhou-oc@zhaoxin.com>
To: anshuman.khandual@arm.com
Cc: jonaszhou-oc@zhaoxin.com,
	akpm@linux-foundation.org,
	urezki@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	jianhuizzzzz@gmail.com
Subject: Re: [PATCH] mm/vmalloc: avoid false sharing with drain_vmap_work
Date: Fri, 27 Nov 2026 10:31:03 +0800
Message-ID: <20261127023103.1833448-1-jonaszhou-oc@zhaoxin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <gdy3cvqeppwda5zydfl3cq37gmihrbizbnio5bnandkl2brnt4@vw5s5wcbejoq>
References: <20260825104659.100134-1-jonaszhou-oc@zhaoxin.com> <gdy3cvqeppwda5zydfl3cq37gmihrbizbnio5bnandkl2brnt4@vw5s5wcbejoq>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-Eyou-Sender: <jonaszhou-oc@zhaoxin.com>

> Should the test be performed again on latest RC kernel ?

Yes. I retested on v7.4-rc4 (b6a9fa34ce41) on the same dual-socket
Xeon Silver 4208. In the unpatched x86-64 builds I tested, GCC placed
the two variables next to each other, with 32-byte alignment for
drain_vmap_work and 8-byte alignment for the vmap_nodes pointer.
Whether they share a 64-byte cache line depends on the kernel config.
After I set CONFIG_RSEQ=n, drain_vmap_work and vmap_nodes shared the
same cache line.

With 16 workers, SMT off and the CPUs fixed at 2.0 GHz, the mean
worker times over 10 runs were:

  test                  unpatched    patched    reduction
  fix_align_alloc_test    6.129 s    5.365 s       12.47%
  fix_size_alloc_test     4.836 s    3.850 s       20.39%
  no_block_alloc_test     4.840 s    3.882 s       19.79%

> s/away/cacheline away/ instead ?

Agreed. I'd make the cache-line separation and the reason for it
explicit in the comment:

  /*
   * Keep drain_vmap_work and vmap_nodes on separate cache lines.
   * CPUs queuing the work write its pending bit, while CPUs allocating
   * or freeing vmap areas read vmap_nodes.
   */

