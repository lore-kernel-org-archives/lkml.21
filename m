Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586748;
	b=gBlN6n+hgeiBJxtAY1YyJPZ2lbUGgV0e2tkJJ+NXekvZFdyXfilLmfU8J0zbML1436D1
	 mmoTAqtRzx8vTMpZ1QAYkw4QXY/sXR4EGLuOF7sjYv082RGTLiMqmP1dn1tl09tvvL08g
	 rsHRHHVumF3v325f70vWihdx/mj/HOSftrdM7BL8Rkz5fxiIlTWNGV316Y/yEcgIdHJNO
	 lw+h228GqgCoeZZzJ6ODWiJ7i4LwFXiK77wiTJLUZL1js0RIPOjkUtNLzRTfTbyfi8D5A
	 CNDUk3M6fLpvlTzRKova9JxyMtePyGIvrR4XcrME92okwIcZwccOJPnpwmC116S1s0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uvWUvSzQGWdU0amQGudBjE2MMEoWKQd9zyN2yG8Iybk=;
	b=o1srkkFsgsgrmWYatHh94msw7jkl2lLavhv3aYrLUOLDL4AVY1epZonMOtHj7+p4z+KB
	 galUb2i3IidZZaJqoIsc0bbP6uAEMZ91nj9uxoPCC6eJFNRq0q5R8w6zrrBx/5YKcthcR
	 AgoleBZe0N+YhVbJiY+0zwKCX2E/of/xe/M0jEFtYzfd3yJaDxCly4j16m+i4VJdUsAYt
	 aG7KIVFXaiDpixn79shHqdAWO4vKK6FFZGM3F1JToyC7hM5L6qyuRNoBHHeuvp4U0Si6A
	 Q82+eK/BPhWj94Q2fP2Q3ULtrve6h7kWNe+nXh4FLsRH6tQBzSPfgX6+IyjlkuVTuAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQ9RGk4T;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16742606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16742606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQ9RGk4T
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38644aedba1so8252118eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795586747; x=1796191547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvWUvSzQGWdU0amQGudBjE2MMEoWKQd9zyN2yG8Iybk=;
        b=sQ9RGk4Tox3CJBgaHd1rERGLKFnMlSEy04aCuumhalHDASrM93RkBheM3kfuO487fS
         RTFW+tp4XwuGTm2cLzQvr1Ge2pYadRPBHZpVt6UPz+xpa8HKhFn7ak/N1YJbo+bu1AIC
         yagdq45DU5MqDJNP3sQBCmYdFWU916d5hc6eXEbd9H2F/g/ojM1sE/XVAvAbzg+zunqV
         O5/aGKchAF1/92KN6ghTvUf/im50ffIbXI0nxFTsGjz3YvZnqkVdbJsZ6gFrnSDFfq2t
         OBnd8/q4v2YL+eEGxvYSPFROxgOxfWusmUtxdTOKMuIuLfZfx/E3dZLIAdibltkRBJj+
         wyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795586747; x=1796191547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvWUvSzQGWdU0amQGudBjE2MMEoWKQd9zyN2yG8Iybk=;
        b=arP8epHCSt7u8X2zZcPu/lOmE+kMCMXX/qgZlFgHIaYcn3JYt180i0JRYXMkvjyX79
         yafzJFvBudFMLSI/QLtNKirNmQ/NZqXwgEYKoPIzdHcN5JF/o0Q9iptNnzt9VOCyfnXG
         ZBiWRpMybaHCrQUAN1w2kRRFZRKKzJbNJAg+/2jhlVT8ZwcSJmXwqw12gFP5sJbpXX8N
         ll80o8on3CQCWea7gGqMtIvdWJe2Bl9gubiuRkC67qzdH88hhY2JN4SfV0lEQvnXFecA
         Pa0vXoKuFxP2wftNc5XSuvQC4/w6HNYoma9PbVg8yYBuQ6RoLSut77my8iZXs29LqqXG
         +LfA==
X-Forwarded-Encrypted: i=1; AL+hErGlixlsr8HbOsXEPgS5oEYFRFeiWki5Li3gIsp0kKwIIc0/a/D3u2a1LTtVbgdSZ1A/zWDhayjp6+Wusdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ch2pFUE/5VIf9esUjAP97V1U/w2wVaBdtjkm4HiyrLvdk022l
	stcUhGQc9P/QS6Se3/eDPpc1qS77XXdw/PJqrFX0umSIWe7x78xjOOEX
X-Gm-Gg: AZFdTZd+WkgFJX9fXjbrv0JWIumpdjXE095y4iAF71fUvVC9bHt3WnSqXfwKwDPOGM9
	VVvIW4uO1Rict4UL4glWmFhH5z8zulLZy8BG5TlcGB/ts2JFiS236ImaWnRXXFWrzBm9g0tUyAh
	8rRWQzx3QD3+HUQD3Szv+5HY13X6IjFbpLjXl/H3PiCSpamb5jA0gZ7xegyJzT8S1R4PcRfmy8y
	42zg0N4SP2DiVxi0hnyVA2q+wNcipkU/SvQF5/SgEguOUcCIXN6YJEjwzsm8iowkd2YbvT4fGFG
	OhT8XergdYbCBOcTDXgF91EKH+KP0HxsJkcuF2F4beJvHJpKttVQx4M/TWHG616bCCF+sfqziaE
	EVY7Gi6lAt53in+EohRVr86iViGaJJFHU6niZyKcK6Ytk6d0ZbwUA/7NCrQgTNelBf6z55PTk90
	jhA35RHtVyD8pM/SFExtmTftnQ+qskT5cOHoVizSXM1VUCFRA5lrT1HfFA0A5wO9fg7ZKO5gsBK
	u6aiVqRb5EoOecUs27KHCkBVjoE+TxxBqu8nN/2H41AGbikxWeE4hU/Qf/mROi/deKmqCIBksLB
	eZMTps+5YPcWFI5r5j2Ub9U++zzF8tTNLoH7oBWjzzlTIBpo5krveeVZeln14rNItiq+53tyZA7
	/
X-Received: by 2002:a05:693c:8948:20b0:386:b08e:4b7b with SMTP id 5a478bee46e88-386b08e4e93mr8414503eec.29.1795586747002;
        Tue, 24 Nov 2026 22:05:47 -0800 (PST)
Received: from O1PCCC03033100.cn.corp.seagroup.com ([143.92.127.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm57080152eec.26.2026.11.24.22.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:05:46 -0800 (PST)
From: "chenglong.ma" <longpareto@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	2312891301@qq.com,
	blum@kernel.org,
	co+6dcbccedc9ec6452@bugs.sh,
	eperezma@redhat.com,
	fangxy@xiaopeng.com,
	jasowangio@gmail.com,
	kmehltretter@gmail.com,
	linfeng.sun.dev@gmail.com,
	lirongqing@baidu.com,
	oss.patchbox@gmail.com,
	p@1g4.org,
	phx0fer@gmail.com,
	physicalmtea@gmail.com,
	sergiiushakov@google.com,
	shubham@octane.security,
	stable@vger.kernel.org,
	stjepan.poljak@gmail.com,
	syzbot+13df72e0dc4be5c62215@syzkaller.appspotmail.com,
	tavhadia@gmail.com,
	tjdqudcks0424@naver.com,
	tz2294@columbia.edu,
	xieyongji@bytedance.com,
	xmei5@asu.edu,
	yuz08559@gmail.com,
	zenghui.yu@linux.dev,
	zhaimingbing@cmss.chinamobile.com,
	zhangjiao2@cmss.chinamobile.com
Subject: Re: [GIT PULL] vhost,virtio,vdpa: bugfixes
Date: Wed, 25 Nov 2026 14:05:32 +0800
Message-ID: <20261125060533.1296-1-longpareto@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <awWOpS3HR_2FTN3I@gremlin>
References: <20261104081535-mutt-send-email-mst@kernel.org> <awWOpS3HR_2FTN3I@gremlin>
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

On Tue, Nov 24, 2026 at 01:51:29PM +0000, Lorenzo Stoakes (ARM) wrote:
> It looks like it doesn't need VM_IO anyway, the other changes in the patch
> make it redundant AFAICT, so you should send something like the below with
> a Fixes pointing at bb2e6f166547:

Sorry about that: it went to security@kernel.org (hence no lore thread),
I did not test it on 7.4-rc, and you're right that VM_IO is redundant,
since vduse_domain_set_map() is the only way vhost-vdpa entries reach
the domain iotlb and it already rejects anything backed by the domain
file.

I'll send the one-liner with Fixes: bb2e6f166547 and your Reported-by
and Suggested-by once I have actually run it on current mainline.

Thanks for catching this.
