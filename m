Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834404;
	b=gvx6w9Qt1TMJJxC4OzKshDkNrnF8gcyGbKBQxlgOlR0TjigwAyaUGvqGTfkeU8M90LJ9
	 NYi8UbcRKSdPyFUUNKY12+tu0Wdfi+4cNQVYuQg2OTdec++Ckoo3BAiyCZ4YpCbV56nJk
	 MbNBdw9ba3UDTT8Yis1x2SugWh85rZJQVGfk98Re2r6SxMB3vXVkGlIoqkzQ9kWJb5AYK
	 uLF4GGGcM1PitKSTcIbM0n7HVVUi83OaUZsKp+RN1ZJ62Kpg/dFc6SdXV0ttyDGy4wy67
	 nqXSekajzG4ebvBuXXN0lYjM633l3MJw06DWBpodTfKJqnpQgUReZfLfLOwesZbLuoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=+YV1M9xD+ag2ri/rWUEPchYapjamG4TNE1eJKE+P0Co=;
	b=wnsUF3soAdH8IC7JjEChII6H25prfQ6vVBpyIQYc6ajkwcITIktWyOuV6u4+aV2+Di8p
	 P8ts9n+hArmTbk7zI5B64BgoXS/gXugCXuuN37WmjVUa1rUpL6sHGA2h0o7KdtuVDFhSg
	 Y6KLcwngq2ZTKgkOKaNA3ZSdkO6tj1UbtIgfR5So5GDGBBR/s7RGiAFhK0FnCpcKUWMSS
	 7PhgTcE15wwacK6v/XAUgTCnNJM12LGnxmfsvvthHe2nmn+ZDfe4HIJbisusC0mKlSQaV
	 9T6AnOVyn1Tl8lhouc0WNDCcNWwBpvbHkihVUvM2TOR9u+nHZ+PGnidPrFucfr6peAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eDjF38Zp;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACE3606A329
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ACE3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eDjF38Zp
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-862aa241d77so2818103a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795834403; x=1796439203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YV1M9xD+ag2ri/rWUEPchYapjamG4TNE1eJKE+P0Co=;
        b=eDjF38ZpcMRKEn3US4j8YDdhnSk76axcZ1xCjeaWL5/ZlXj6z4XpbxLVXKzlvjqH+u
         OAIyQbRsaiEvdi97GNBisjq1PQa4JHOPPUZktBrVuL2D99uX0X6w+lGXCFd/z/xughEo
         uRRpbfwrWYZH/A4DHvGIKMfIVlD8iIq7qYEcTNas8apbAcT81hWzZoPnJmyJtUJQQiKU
         Rv0x1d0QwxllckaZh5ucWdX6IVE95nWAYtTHkz8+TPpVl1X0GDmTzVNH3xzL2a9PX9oW
         L93Z4Dpg3wFJ/FczTsJV9B9kLe3gqXZ2LqPheyG3Q9JC2d2N/ezfM5CF+4kZDE/bxbwU
         eQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834403; x=1796439203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YV1M9xD+ag2ri/rWUEPchYapjamG4TNE1eJKE+P0Co=;
        b=CqAiNyqDOV4LOwwlnGPNIKeccUvLcePgdD/TMx+q4NH55JdwKhDiSZ2VJ3bNbhltkm
         tN8iCVPD/VGtyhNHOmER8Xzc8kvSpjFkiOtTJQJyWy+ZCfXwcmvBPdPZpWwHpD7GlkFP
         rhNxzBav4FU2RZjNLb0daCP4pgcICzt0k9fqmcw2BX4OBkYiHZ/ObehC1a0EFJ8vbxOB
         4QI0E4x6sHazV9PhabtgbDjq/AfQCbGsdayxJSpZUC0Pqn8tjZioECksV3jgsub0xUy9
         o8MFS16WMVfX+raA97X6RjLnraTRmgIT537ubSSVNf5YMAyG8pEsqHg/TwoSoWbelhl0
         7uqQ==
X-Forwarded-Encrypted: i=1; AL+hErH4HuGGs6UBdRvQUp9UYHeode0E4Vzxc87lxb+ltCQQ9rUiUs4oYgxiuPJs8aSZPZM3LWX349STOReQffE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kXga1lJPuWZvm17Ns6lAMcG9FccFgK1oTt/UK29qOdjUnmmW6
	kTg6Fb+QHkeX/uOVAfXb6rcLfotvFxEGiegmX4nAID1rpuPB5/VHIE8c
X-Gm-Gg: AZFdTZeBxWUzE+QjJUGaOVooYeKUCb7NjWY/z7W7QMMyzCPBwp5HS6VNTLpfWriBFe5
	KoDM58K22rltowgG4cwVQ6/TI9RrmwvMN0nnO6kRzxFSCBIedZpBls39jzMT8bTdq3/N5SJakyT
	ZR/VnHYlXehT2gwXB/N7P1RDOxm698NXLuV+DeWrpcwIpatXnr+kWQK6uzlEfnC3HY5xUp5OWvE
	sxDBJZTx/tvficdFXLxZY2guuL8vbXoS81EJ1688yRIzjGi9B74OVH2NK2D6LE5mJtXWKyGdnad
	9imbUVZtBgp4vwMmkVW/cR3QWOeSvqEPXnIZz98sW70hYIgsGmpwj+Hxg5nabtJDnhHrXyw+W7J
	qEQLhC6owPGjgMST+C20vIT13Ke70gz4IH+kxSvrjFyjVG++TbDSSd0hFBJYb1KOWxf2SUW7uGP
	+eUUX32AFmYDwm1wjNVptkiKftrAeO8k5zZhM5RCTejG1SZJly67tp3lorNKkNt+SuBO+EfrorB
	ytgYFhA8NjNSL7BSLtM6AUE9l5TIb5Gov9HxZgU4kYl5GRvWdQ9nmjtPYd3WAoKUft/VOU8deI0
	v+svMK4V7wBCgaNgmGpi56tlytrzOjkeH4K+5tcq30MItqMlzBKgSIpuZuyrYfgU6oM5RSEcJd9
	nsOzg0VTd4UT4oEyyJLnvk8r4L/ERK25TEWZs
X-Received: by 2002:a05:6808:3501:b0:567:d689:9b62 with SMTP id 5614622812f47-57a037b96e8mr29415803b6e.0.1795834403462;
        Fri, 27 Nov 2026 18:53:23 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4f::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a2eb50d63sm19929493b6e.0.2026.11.27.18.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:53:21 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	kkd@meta.com,
	kernel-team@meta.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Puranjay Mohan <puranjay@kernel.org>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1 1/3] compiler_types: Emit a BTF type tag for __iomem
Date: Sat, 28 Nov 2026 03:53:15 +0100
Message-ID: <c4f497b6646542ba7d856ddec7d912b680b017bf.1795834380.git.memxor@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <cover.1795834380.git.memxor@gmail.com>
References: <cover.1795834380.git.memxor@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; h=from:subject:message-id; bh=CHaP6k63JJpG2wxpySBkgkJiMm4kbFlqyFVEkSg4BZQ=; b=owGbwMvMwCXmrmtenRyi38x4Wi2JIZvLiaepZo119sSTc0ovPN7to3d25ltD3W9mKnmC9ROSjrO+ PHqvo5SFQYyLQVZMkaXk/z4m4xOVvwNtl3HDzGFlAhnCwMUpABNplGZk2BxeOWc6//KnJXPXirv96f t9neN7wYOvfl90UvIspq5ZcIaR4VgDo27Dium77j9m4lyfEDore2WE/Pzmx+VLP0jfderr5AcA
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=B34BD741DE8494B76E2F717880EF20021D46C59B
Content-Transfer-Encoding: 8bit

__user, __percpu and __rcu pointers carry a BTF type tag, which tells the
BPF verifier what they point to. __iomem pointers do not: outside of sparse
the annotation expands to nothing, and in BTF such a pointer looks like any
other.

Define __iomem as BTF_TYPE_TAG(iomem), so that BTF records which pointers
hold the address of a device register. The next patch uses it.

As for the other three, the tag is only emitted with CONFIG_DEBUG_INFO_BTF,
a pahole that supports type tags and a compiler that has the btf_type_tag
attribute. The attribute does not take part in type checking. With the
config of the BPF selftests, vmlinux BTF grows by 892 bytes for 27 tagged
types.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/linux/compiler_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c5921f139007..8cfa555664e9 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -67,7 +67,7 @@ static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
 # else
 #  define __user	BTF_TYPE_TAG(user)
 # endif
-# define __iomem
+# define __iomem	BTF_TYPE_TAG(iomem)
 # define __percpu	__percpu_qual BTF_TYPE_TAG(percpu)
 # define __rcu		BTF_TYPE_TAG(rcu)
 
-- 
2.53.1-Meta

