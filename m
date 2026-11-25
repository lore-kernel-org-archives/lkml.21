Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571798;
	b=n/yMZ+MspVu7SGVlTvycD/IuXPB0mfDcN7pEn07lC46LYb2MeT4yOaoDRcmdXWZsGSL5
	 qn44Tr2kRVE7NCHMoNLazqZtgPJXsWAXYU7iArrTE3Jcv7JG9blHW6aEgDVgSaSCiNX6U
	 X8fE41zNxMke3Cj2l3ans6+fy8f4WVCKKZAfLgL/ACRuIBanyh3wI06RqMzPKucZn0WMo
	 jKKUT3ZdbORHEcK53I7pAtVYbjcIRxGpHuYPXRPG6oVVodxapNDfHkarRls5yfmEY3Nrs
	 stwCiWmfb4WgZqbkVhSXxLfoMmfEHng81oYBQGin8+fh7i/WnYqG0zSLvqZj11CGhBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571798;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=hm2wuQFLmV9LQkNdJSRDFRXDMHH9iqFd/UmD1zt28t8=;
	b=4PbwGalwlp0gxu/Q/m15m2spvgUbZ89BHLfmeGYXQ5JgoJR39g1OiuKS7Vt7LEyW+OLh
	 rm81lO9hQmroGynif56wytHEG975/ca6ZtfDqoJ91UnraHbZ5ToGIJMe8pjkuUpyax4av
	 YN58RNrPzXwC1/g5dpXeI47d70k30jZrhnGkuCalgSQ9s9YsvxCau79gr1c51Os4If1go
	 1Y4qvCif8TRtbYT5f7x1W9IAM11L3j8/H2XoZvix/rcqjiVX+vxZD2wa5Sl5O8NKvZ2On
	 E2qMXQRVhEAUn/SQNzA6bIEXkAyVPkgXi1uufCmmsHELM+WZ9fkwouzun1D8QCnNHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QEgfzzl3;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10F5606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A10F5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QEgfzzl3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795571796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hm2wuQFLmV9LQkNdJSRDFRXDMHH9iqFd/UmD1zt28t8=;
	b=QEgfzzl3GUt3sjwlKXm+W6J2xej0m5IXXpWdAgol7qY32njuzvgkGB8k2M7IsgaAfntZ4/
	6WXJoFYoa/DTmYN/3GN+AYGmd/uqNoaTyjZc5JBUhGvs2kONc2L6ZGNKmQisuHnj45DS+W
	EYhEI8uMATomF2RVzjkp73JtjrcP3ZE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-jE-MGSAOPwOTFB2-Evq3dg-1; Wed,
 25 Nov 2026 01:56:30 +0000
X-MC-Unique: jE-MGSAOPwOTFB2-Evq3dg-1
X-Mimecast-MFC-AGG-ID: jE-MGSAOPwOTFB2-Evq3dg_1795571789
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B587180049D;
	Wed, 25 Nov 2026 01:56:28 +0000 (UTC)
Received: from jhladky-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 11DBA30001A2;
	Wed, 25 Nov 2026 01:56:25 +0000 (UTC)
From: Jirka Hladky <jhladky@redhat.com>
To: will@kernel.org
Cc: catalin.marinas@arm.com,
	kristina.martsenko@arm.com,
	luyang@redhat.com,
	dockseed@proton.me,
	jmario@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: clear_user: keep alignment padding out of the zeroing loop
Date: Wed, 25 Nov 2026 02:56:18 +0100
Message-ID: <20261125015618.1331650-1-jhladky@redhat.com>
In-Reply-To: <20261124233043.1289050-1-jhladky@redhat.com>
References: <20261124233043.1289050-1-jhladky@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi Will,

Some additional measurements supporting the patch, to quantify the
impact beyond the /dev/zero benchmark. Since the fixed loop is the
generic zero-fill-to-userspace primitive (clear_user() /
iov_iter_zero()), the impact scales with the number of zero-filled
bytes in any workload. Same A/B pair as the commit message (Ampere
Altra, Neoverse N1, two kernels built from one tree, differing only
in the label move):

O_DIRECT read of a sparse NTFS3 file (2 GiB, fully sparse; ntfs3
zero-fills such reads directly into the user buffer via
iov_iter_zero(), no page cache involved):

  kernel instructions per MiB:    791.1k -> 528.8k
  throughput:                     11.9 GB/s -> 25.6 GB/s (+116%)

The instruction delta is again exactly the two removed NOPs (262.3k
per MiB at 8 bytes per iteration). The gain is larger than for
/dev/zero (+92%) because ntfs3 zero-fills the whole 1 MiB read in a
single clear_user() call, while read_zero() clears in 4 KiB chunks.

/proc/kcore read (1 GiB): 1064.4k -> 990.7k kernel instructions per
MiB (-6.9%), throughput unchanged, as the remaining ~72% of kcore
bytes are real memory copies. The arithmetic implies about 28% of
/proc/kcore read bytes are zero-filled holes.

For completeness, tmpfs hole reads do not benefit: mm/shmem.c
deliberately copies the zero page instead of calling clear_user()
("Copy to user tends to be so well optimized, but clear_user() not
so much, that it is noticeably faster to copy the zero page instead
of clearing"), which reads like an existing workaround for exactly
the cost this patch removes.

By code inspection, the same zero-fill path serves sparse reads on
Ceph, SMB and netfs, so those are the likely real-world
beneficiaries.

Jirka

