Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068876;
	b=z/iwSrVWoOnGyPIXXlzmJjFk913iLdE3Jf1FBe82IeEF8jeYCTRhXHa/56VWtEMwFs5S
	 k1ZS2T14GhkO7CVJ0v3TgLrbWTONdueRQIWcMDC1V4fiTZL1pT7CjEV67nx/f/b7QRktH
	 RBmnsZ1xFlNdLnvmPZ+KQV/DmNAMw4xrygHDJEAF5x8doEL5ibYphAeLi9l9U+E07x1tx
	 2Bu07GQry9mYHstlG1jU+5d05xsVTkci68ksKD7MsI/t8nMS+q/ul45o6uzwrP78lBiD9
	 bLh+klZFR7gBrx29jZROnmUBvsQQ7cQJk7bi4aPOjAhnrkdNFe5t+N+3wzsJkD1M9IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068876;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uyNcIWU98Z5sXldk3rimj6Mr8PsEsaCViQ4vLgBGmJw=;
	b=SZluqWKQjkbebB3BpTu7+lEWsjDcTk92zu9+cnD4TPnptnVjCG8EM1qkOU/3Vw+AJwvL
	 KZcSWtt7GOVj2qIYA8ZIi9xxPaGXatpdInxYaK8EK5tm54CFp3miieXB/IcP7vtBuR1n3
	 jJQbTX9WhT1gunMEVzurgsCvPz3igtBDYE9HuQy3E5RxqKTjl8srOobFpHgp4zAkYQO7u
	 +LPyOH6ZurZkW4cDcM7Xs5d/pzAP60PknhPutj8ZUbRN0BXjAMoTjJQolcsbCfz1XQ29y
	 YKKZvk/6wC9SmUwUtdmum9gFKSbZtWLro+L6q5SGerPfxr1RLCMPTtBco2c3vif7ZaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uV7N8ykR;
	arc=none smtp.remote-ip=91.218.175.228
Received: from mta0.migadu.com (out-228.mta0.migadu.com [91.218.175.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2025606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2025606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uV7N8ykR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GA8YRDDsX8w23iFpR9GtsbDqe3i45tsbQcbqUbsfOKM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795068874; v=1; x=1795673674;
 b=uV7N8ykR+W94LOSdAGFCn7EVuSJUOOHuQinWgQ0L6exNl3kn+I3DD/LH8i7EIpw4B74lQt+R
 EdlvX04di9W9tWN6TT7KkBuH5z1mQhzLkncjP7z5vJp3ubXRAtpJNKGaYg6VT8SXwkL+s2Sc/nZ
 FJDCUnqnRrE98P3IJUyV1iAk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id baff99afe0cb7e01;
	Thu, 19 Nov 2026 06:14:33 +0000
X-Mizu-Trace-ID: baff99afe0cb7e01
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dm thin: free thins with kfree_rcu() instead of waiting in thin_dtr()
Date: Thu, 19 Nov 2026 01:14:27 -0500
Message-ID: <20261119061427.1452945-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119051620.507189-1-bmarzins@redhat.com>
References: <20261116-bug-dm-thin-rcu-gp-v1-2-14ed3567da3e@linux.dev> <20261119051620.507189-1-bmarzins@redhat.com>
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

On Thu, Nov 19, 2026 at 12:16:20AM -0500, Benjamin Marzinski wrote:
> Qiliang, does this version work for you? Could you rerun the timing?

It works. I applied it on top of mainline 63fdb511c27af plus v2 1/3, the
thin_ctr() patch, with a test-only 3 s msleep() added to the pool worker
after each thin it walks. Thins 1 and 2 of a three-thin pool are
suspended and then removed while the worker holds thin 1:

- With your patch, KASAN reports nothing in 5 of 5 trials.
- With v2 1/3 alone, the guest crashes on the first trial; earlier
  runs of the same test reported a slab-use-after-free in
  get_next_thin() in 3 of 3.

A 300 s run of thins being created and removed while the worker walks
the list, on the same KASAN and lockdep kernel, logged no kernel errors.

Removing 100 thin devices of an idle pool with dmsetup remove takes per
device (same boot, mean of five rounds, min-max of the rounds in
parentheses). All kernels are mainline 63fdb511c27af with the patches
listed; the change is against "v2 1/3", the thin_ctr() patch alone:

  patches on top of mainline           remove (ms)        change
  none                                 17.0 (16.6-17.6)
  v2 1/3                               16.8 (16.5-17.1)
  v2 1/3 + your [PATCH v2]             13.9 (13.1-14.6)     -17%
  v2 1/3, 2/3 and 3/3                  14.1 (13.7-14.4)     -16%

Thanks,
Qiliang
