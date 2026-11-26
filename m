Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697359;
	b=aY3C7pqQM8BSfKEtbuOnIl2GzMliZn9iqiKk72SYpgPlnvZWl2WVCWCbNqwrYCw2kYns
	 tjuqjYEaoPTPPQbypzCkLjSOwusCafJo5bsYp9bLjMvH5WbVmv5mmC/YqgeXWDOYqupT6
	 7OgJFi+yyUZhYWuDO/gEkJnXoy9D43ibdSK40PnbK7rgPCUlB2v+bR/lV67yCUnuXxiHI
	 nu05WEIY/nGrCERtwUNJhrDYazbGjQ0XCkLpC+mGtYF9eDVv0+dtjEOKcXUIKmPR3E8gA
	 tGTEk8iKg2HI/IskQjea8hmpqxR4YROc+KBH82JqQJlrlThcnfGW2n5LRJ+9VnjfZ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697359;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=XaNxNGEs8cACYJ1K/c/IGhLzAXT/1C+t0RC4e7xy6jI=;
	b=AexLj393Mb3zqDqFyoyrOAr1Bvx94HjAPIubTw952UpyJbHuNGOsrNq/aZEVwTIFItXI
	 Y3lWf4AGBq7WvTmLRZQufh7pW5x1iC+DbYBWeaVPlvoigjzmRQcNbxx4JyMlcQP8+gQbo
	 6OtlN1iQZJwEAM64FNVBlh/GYc8c5BVoLrogevMXsYyPj1pPHePb58NwWIaRNexb3kWvX
	 jwGvub0igPNd/0XuNaewBg6BBhyt3WZMrjacsde70SehiYg4RDiZpUJDP3O98F+A5rk14
	 +ev3dZBfNoU4TisVxqVm4mkInrAxlTBJI+t7j0kyXQ5luF+JTjM2b+CEsZ7/18ETrkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pa5SZXUl;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9342A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pa5SZXUl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795697357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XaNxNGEs8cACYJ1K/c/IGhLzAXT/1C+t0RC4e7xy6jI=;
	b=Pa5SZXUldkEDLrShimdUIe9eX3YRp+EBgKuExEbZ0vI2Kiqkpc4Wr7N1SwCovFfueImIPd
	PzjDJ8nCP9KcHzqDPyRf9854CfewLse6pYNVM9eS5c/oYIokNWq633Z8K7L3LDaYdsFs/0
	E85xc9QUdLaf5Wown0e/zQbtJZEu0ys=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-T43cQlV9Nzy7hOD_uxtUnA-1; Thu,
 26 Nov 2026 12:49:13 +0000
X-MC-Unique: T43cQlV9Nzy7hOD_uxtUnA-1
X-Mimecast-MFC-AGG-ID: T43cQlV9Nzy7hOD_uxtUnA_1795697352
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DAE811800349;
	Thu, 26 Nov 2026 12:49:11 +0000 (UTC)
Received: from jhladky-thinkpadp1gen7.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 17F6C1956086;
	Thu, 26 Nov 2026 12:49:08 +0000 (UTC)
From: Jirka Hladky <jhladky@redhat.com>
To: kristina.martsenko@arm.com
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	luyang@redhat.com,
	dockseed@proton.me,
	jmario@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: clear_user: keep alignment padding out of the zeroing loop
Date: Thu, 26 Nov 2026 13:49:01 +0100
Message-ID: <20261126124901.1690779-1-jhladky@redhat.com>
In-Reply-To: <lnh4ij6zpo5haddbkvxjp2gui6xlgjzaxkrmh26xgovc2b3muz@2wapkzpfnceq>
References: <lnh4ij6zpo5haddbkvxjp2gui6xlgjzaxkrmh26xgovc2b3muz@2wapkzpfnceq>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Kristina,

Thank you for the review! Good catch on the path: the diff header
was missing the arch/ prefix, a scratch repository layout mistake on
my side when generating v2. The code itself is unchanged.

v3 with the corrected path and your Reviewed-by follows as a reply to
the original patch posting.

Jirka

