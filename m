Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012899;
	b=jocN0bHPJFU3koMXwj2K+JVnMQmhuK7LG9ygsAb7Oq4aYinU3z3NdkIGPSNE+35NV48Z
	 hAzobDYjIuv8LPITHmUlRJNCXS77K8Cy35R0RrQ5tzdVhOHNpm/LJNbMqwz1Za5JahYJS
	 ya5EjQe0OhaUCqIwpbDtGRInWX2BjDIsON2Ly+U92ke2Eo1aUCXYbi7C8wykh1S03WxRJ
	 ocskltxjSliZQpYSi2LogI9RGUArggl2UTKFdfQgsGou0dSzjwN7Q0VVbp/jEYdF04sku
	 62ccly05/1yev/51krV1ZPh01DGo8yRKUHbe73ir53PgZ/KQYnuG//iWcoZ767QAxTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012899;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=wxU3d2BtYa9n3sGwgS81YBp+BaQBDVvXZNu9QMElTjM=;
	b=MuMz6x4ipag8dqLOR9dvfIDF+PS2pFvf1e5ac1RPZfXW2SWiRWDmq7F9PVyIkFlN+Fcd
	 asiMHo3UeXff17eWuOKm1GI0DefGUtAPLBfmlbMHiLYgldD4KjB8aVhCs1vfyrb81Njgh
	 bejUfLtZ6wnmAvO8Pl5x/AfL3a/9P5dSNYtjVj2GkxY8WxDKN9JQPQu4JxUSsDSnSWppb
	 3XKbWOFPDMZ816Aempl5hRBvyeZEB5gYwaral/w7vw+qm0Y3qdd2dSQYncSwA1KQzrEIf
	 g7hiQgShzZvekqDaBf0XOgP4fw+2GzuFIm24Nz8tROh1ylNvtNi5+dv0Y2c1ZgxH21Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BJb+tBdL;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC87606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC87606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BJb+tBdL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795012897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxU3d2BtYa9n3sGwgS81YBp+BaQBDVvXZNu9QMElTjM=;
	b=BJb+tBdLBhPw+KJAeyNpiY0BhpGOlAlA9APBbF5G1tfUl/CQKw1qq6HvdWQTWPgUxnAvM/
	iGaspwyWGW8VPxWfLCUgIEf2aES2Xk6TgXHxvGT9zjtS71jZGskmAeQEjm7kq9ESl+hv/u
	iWZ/a7oGYaX+m1nz7NbzisZV5hV/D4o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-2uacoIF3MgCeoqTcc7XjLA-1; Wed,
 18 Nov 2026 09:41:34 -0500
X-MC-Unique: 2uacoIF3MgCeoqTcc7XjLA-1
X-Mimecast-MFC-AGG-ID: 2uacoIF3MgCeoqTcc7XjLA_1795012892
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D6E4819560B4;
	Wed, 18 Nov 2026 14:41:31 +0000 (UTC)
Received: from jocolema-thinkpadp1gen4i.rmtusco.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 728361801977;
	Wed, 18 Nov 2026 14:41:28 +0000 (UTC)
From: "John J. Coleman" <jocolema@redhat.com>
To: zenghui.yu@linux.dev
Cc: akpm@linux-foundation.org,
	audra@redhat.com,
	david@kernel.org,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	peterx@redhat.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH] selftests/mm: allocate nr_pages based on pmd size for uffd pmd_move tests
Date: Wed, 18 Nov 2026 07:41:15 -0700
Message-ID: <20261118144115.2112331-1-jocolema@redhat.com>
In-Reply-To: <38118330-5cd6-4f32-9098-a3d07cc7b3cf@linux.dev>
References: <38118330-5cd6-4f32-9098-a3d07cc7b3cf@linux.dev>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Thank you Zenghui, I appreciate it!

