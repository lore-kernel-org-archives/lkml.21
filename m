Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795377157;
	b=2ndAOg8x6fwVDDXjv7FQn32jHXpdfuHIfDy4NffVCl0SMo0shB8gLmwwF74YIw6yrwA3
	 XRonZr0Y6x73vrZkbd+Uj8vlqVi8BUHm9T9lWMDD68Ijk0dz8WPdXNRiL55C8ZfPUILqd
	 ZFaXrnAf+/w0C6aKVdFeNLvQaX1cJaXdSYu1RmY2cykJbY7i13j5udDGNVKcFten7UNzX
	 BhMj53+Vy/n/2U96WAigIRuGD+dBQfvTJd+O2fr+FuOzbXZJRwXOUTPE5Ly0bnzpPD5hD
	 KvXtIxsVvAevfQ3JmzluOW8BzR42v6ZjcE//HDD8dYYjqI8+3T+hkvTERLKAnjFq8nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377157;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7VGrb7WS71DyyI0fhI2DRFpkOSU2ZVGtaAzlEiilKBQ=;
	b=TKUFOW7QmA/LBOxfWfvu6LKcq39noyQml+ULcIDEgsbWwtVrQZd1LhPQDRG8rwT2x6Bj
	 RCvMjyjSSmshnzxdTqrf/UCuiZprUPPqr1+NcmSLvxvoRX16CZEvJ07S+hJEeegqh3gbG
	 y1xPEG26mgUNHW/YeHYjYIkv6pJdTtrZBUOy0W0dJr+wXQokRgCiE6WiQ5/GRMrXdkLFS
	 t81kbcI4rAJHh2OdlSgK/cjY1tffNu4fDHm8x98yzBx6C1CVO3jyo9YwbbPPD98KIg/Bg
	 wxD6NpK4IF5PFvQAeyzsAnIbfacrZML1Xz57RQKmhJJpvMWEfwMpClYhAu/VS7f5o0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E40nSBS+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jGQjXShH;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B53606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B53606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E40nSBS+;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jGQjXShH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795377155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7VGrb7WS71DyyI0fhI2DRFpkOSU2ZVGtaAzlEiilKBQ=;
	b=E40nSBS+Jz9PMmr+jzFH7nEdOZE1NPKTHLZ/i747X8I7m771U0XbDQGcBDOEKw7U5kCx9V
	sO/wv8qB+btM5x0gp0vbzJ4i3kWPN++QE51Z81WeMLQUoUsETj1V8ZCz7Il1NX3QHTYReL
	w1rRsk+LI2AjNxymGF2CJtB22SXYjkk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-mURoYxBQPKeUUDkNvJaqXw-1; Sun, 22 Nov 2026 19:52:33 +0000
X-MC-Unique: mURoYxBQPKeUUDkNvJaqXw-1
X-Mimecast-MFC-AGG-ID: mURoYxBQPKeUUDkNvJaqXw_1795377153
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92109408212so57763246d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795377153; x=1795981953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VGrb7WS71DyyI0fhI2DRFpkOSU2ZVGtaAzlEiilKBQ=;
        b=jGQjXShHiWJtUpcD7wnqoYgpsH8xKOLYuBIak8R17aYJQDJScaxzdAZR19LlLqg1NE
         1ONGnyccmRwoxVZ+SFpv66U+Fh63EmE6Cz4kkWFfk+w2I5yZB3tsU3erT9ry6fo1NX/w
         hHCvojRW+fVrWVH1p3q6kPhAh+OYlX1qClrqa8TyHOSYU3Ry4gwoN1iQLmr0XDGOibea
         R+ZzT1PCsKX8eGzhdvNbTBF0+XlF6N6qUGcQEdTiF+NkJxxZihp5BHq+E31nkDbzqEv0
         YX2O6XEIPTkG0w/h4MzgANeU3oz5P6azOvVhQFfqyzE6VNs0D5oFKKyQr5DUxGuppD0E
         13gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377153; x=1795981953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VGrb7WS71DyyI0fhI2DRFpkOSU2ZVGtaAzlEiilKBQ=;
        b=T80dgJnhd9S+5NVOBcO/dX4P8DJXCygCbnMLs4bKon3aWcLJrofoQHXhb2MXjfD7fn
         GdCndg5CvLmG2XBfn5Q9ZnkCGHVRfuz+3IkqIJ8HdrN7toauX6WizRHLhJvz8Urvc2Dk
         v1GXTHEngra0asp33SMIKDoVmSi/DsLxjMmR9ev9vJC68qasNG21CNThKsqjF+7vQrtH
         munCC6rUYI9+aWmRk13bVeS3gfAISb4PV+NyDSx3urn9Jz2gjNeTibrgmGTb1a4nfgcA
         XslaNLEHC0ewWhQYbq7RJORIpYkjxOO3N3TbfU21ZT4d/N5TWsXbu/JkvJt7agVKpk1K
         uphw==
X-Forwarded-Encrypted: i=1; AL+hErG9ExhhtYKhslyLN2a7UwxRlnfyRmz1lBc91TtfFintnPl/2yMAohfthIBoCGaYav4nQIDJuj5eECREPAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cEkDpjKfJOepMQzZzN34ub8TMXPRut5Rp5XT4jp+PN38kwupf
	aVHr0kz/PpYN7R7dcmar+3bA3DCWL3Nq8JyFmVj8UO+ieouDzfIVUgEeXfmc7ODOlVcrxTr0dFs
	SSlEUyTXIOno0WZx2TzCbFSU7b2b+qpabwe8lrSHVGRuHXebkKpo/bNNIRVG/meBWhw==
X-Gm-Gg: AZFdTZfe2BUDvrpZx9YGh0vy4pcYD6OZYkng3FX3Yc7CIjmHNL7cjOPFo9FpMExtC1u
	oOSQyKOYrT7grlhns21MJ0nOxi8MLn+2m55m7zi/limXoj+WaEumeFtm6SkHJEPjCfMvGropTsk
	xdI8bvS7qu5U2XoM+IIDd531o2ISQoJJS7FzUMpJm1Pi5uHU7qYkUMUmUa7uuQ98Nh3LOa1zTnC
	bLLqRaQFQdHv4C3UT1CqH10KxuR9wS2ucylO6u48mdbYL1zJ0WnqpzKJRZod2bq2PLWumHqWWmA
	6dPq6zpfXPOQRVmF33Ze/EwRUHBvJ17kYxmHrmbUiSg64Gjewdv/v6ASFqgHaIsxO845Q0LsHLR
	3jbPTlugzlEltgrqtKBWlWnieI9l22cPxSxe8cE2LeIlyfhl0PvmhDTcrLgEGMEf8gkPHFaKOOb
	LRoMW6XpJ3bMHAxJUNa5YbnS7GdWAlLqXg6CQPJvjNekJgZkt5znvCtz4swc0KV7/IJR2RlYYL9
	x23/I2R7baaF3nZg7p194fIvVLOR9hrVm+rIOQd4wCpolDnV198
X-Received: by 2002:a05:6214:4886:b0:91e:77e0:fc0e with SMTP id 6a1803df08f44-92134bbfcd6mr164732316d6.57.1795377153050;
        Sun, 22 Nov 2026 11:52:33 -0800 (PST)
X-Received: by 2002:a05:6214:4886:b0:91e:77e0:fc0e with SMTP id 6a1803df08f44-92134bbfcd6mr164732156d6.57.1795377152657;
        Sun, 22 Nov 2026 11:52:32 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b0827sm85693066d6.8.2026.11.22.11.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:52:32 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: Xiubo Li <xiubli@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] ceph: fix mdsmap and osdmap use-after-free in unlocked readers
Date: Sun, 22 Nov 2026 19:52:25 +0000
Message-Id: <20261122195226.1328644-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111161830.1336485-1-max.kellermann@ionos.com>
References: <20261111161830.1336485-1-max.kellermann@ionos.com>
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

Hi Max,

There's a separate xattr-limit window in patch 3. The map handler installs
the new map but updates max_xattr_size only after check_new_map(), which
can drop mdsc->mutex and wait for a reconnect. During that interval,
__ceph_setxattr() still uses the previous limit.

For example, if the limit is lowered while another MDS is reconnecting,
a client with XATTR_EXCL on a file can accept a value that fits the old
limit but exceeds the new one. An MDS using the new limit can then discard
the oversized dirty xattr on cap flush, even though setxattr() returned
success.

Could the new limit be published before check_new_map() drops the mutex?
Also, __build_xattrs() can drop i_ceph_lock; could the second size check
reload the limit instead of reusing the value sampled before that call?

Thanks,
Alex

