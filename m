Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477187;
	b=3cVM6OkG9OYT7VucxAh2/xQ25oJ4MGJjmF4K6OfAXpkFY/5xzwoLdCtxIkdVjj8f9pSX
	 PMx4VeOE52YZ8Ctd89gPoGUYit6GAVJlui+bRgEDjnGs301HZWbHeNsWqSlWhoFoLySNz
	 D4PwsYJKtQi/NcAgUaRdliIGVxplm4WaP1IyRLDjXzuY3DtUNmaJZVI3QjkI8lj4ooSug
	 ihEnh7OStV4x0oBbZq4eAxDWK4qBMTz5HCpIHIylTgCo34C/aIi4HhpfFOHrou+C2pXUL
	 MG89tNKnUkEAHlM8Q7Y134gpl95oK1MoVDdEaBYuXOcTiK96CEPxS96qzaLwWi7jbjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+dO/10Kb1crg9LuSPobtfRm8dvZ5s9kHfaOxT9vk0Y4=;
	b=QPapvE+fduFj7xu3/zZZE5BUJMPmHdTgq00tW5BX848/u0l6l7PGsqfZkDTZwdFKHHF1
	 jEoAj7FUJbn5vuR5UEmuMWHa5FgMP2GrYFOMmrkK/zrLR0U9LhAGavca78z2qm0FRoeoC
	 ABhfOKtRaCHC/Zn7yHscHE+1cUMvSGDz+VrLOfa6QRMRNXwi/6NO6dyVO7zn7IZ7/6ema
	 CZKD3kqpEi8dC/BERh3twq1tkdmjuzHtAp0s+XgJ41Yd9ttxE3Qp6EnRRyvzs+RJlAiYA
	 LHtFvvZbWUG8ypkPp9XuSxZQegqyf+qjupEaED09KX++n2esdWyJ+4y1ty+rJwKIjvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=niE2AeVn;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE462606A6BA
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE462606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=niE2AeVn
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-47d75bcf3ebso3148037fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477186; x=1796081986; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dO/10Kb1crg9LuSPobtfRm8dvZ5s9kHfaOxT9vk0Y4=;
        b=niE2AeVnRw2c6/kDzfZueVucepsafT4okuqlDXLtntQYSgRwGPSuA1nnzXwnP0trJK
         utuKkwFj9hfjjNsVHbebeIRBlDaYeDp6KwJ2nCNti0p8D5P6NwoyzZWvrxgRRZrOrku+
         39VZEsc9Z8GfjMUO9b0GcXaoobXD4DL4/fpzgU9p3rDu4GCkn8fv641iBaHMascmzyMK
         OJUQIiyznFTtJAxDBl0J/yteDEvvs8lfo6dPMGm6Z1OwySzoHVOo1tpsCNCqAecYlozZ
         2nyEmKOyLpwPjlBvg6NH41M1DIzxydnejpri9sTQfg1FlsXg3OUwOzaEKzXxSg111wWI
         et/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477186; x=1796081986;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dO/10Kb1crg9LuSPobtfRm8dvZ5s9kHfaOxT9vk0Y4=;
        b=ZrVbrHpAePulnsExFe96QOamUyPEI/aOUUS0b5eaFwqhl/y0V8XvKRNw/Fs9RHDZF6
         qVeUMKqHCmYltuX24KfG4SAQN0wTL0uZhjqiiFmoAufyUchJ/v1kaf2NdIkwthspoVve
         WoOLCmbpR1cZn/o5OW51A4gegMu16S95PE2AL5rqjQCBBq3Y2aEosBRjvyfAvn4pLfEq
         30kWf41yHIlE+Zhv4POEpI8z47RSTf2NFS5yZ30yhaExOE28VXUBiLQhpw6yLn9A7cB1
         ko3O9CAdcIyi6DLdstQ0wS2nG+DOu0vEKNXmcgjD1A6eGkGwwU10FVHappF0nuJvIo9N
         3U6A==
X-Forwarded-Encrypted: i=1; AL+hErECC5rjTTw/FsZFsYTg/OeniivlfMoY71PgJc7k+Lqkt52Ih/VwwQiNKswZT+OzNUMuYW1oIH9mneDq95o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+InnlouPu/cPNsujs28KnLsz2KDoQkok3vnAtivK8DXDpgch+0
	oH2ghBhwPoh7HLRtGEa9LJA9IM+1OAsT1Gx8idFCN+41fVxlHC7t5fVZrn22M7M2qCgEhKXU3Af
	f0yA+ppEM8etSqA==
X-Received: from ilej7-n1.prod.google.com ([2002:a05:6e02:6207:10b0:54e:a760:20a7])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:308b:b0:4f1:6c9c:78d3 with SMTP id 5614622812f47-57a0a92272dmr14361377b6e.26.1795477185579;
 Mon, 23 Nov 2026 15:39:45 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:17 +0000
In-Reply-To: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-13-dmatlack@google.com>
Subject: [PATCH v5 12/18] mm/shmem_luo: Allow preserving tmpfs files
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Allow preserving files on tmpfs mounts by dropping the link count check
from shmem_luo_can_preserve(). The check was meant to limit preservation
to memfds, which never have links. It isn't needed anymore, since tmpfs
files are now retrieved into a file on a tmpfs mount.

Userspace can keep using a linked file by its path until the Live
Update. The path of the file isn't preserved. Userspace creates the file
to retrieve it into, and can then link that file at the path it wants.

Preserving a linked file affects everyone who opens it by its path,
since its size is frozen while it is preserved. The permission check
added by "mm/shmem_luo: Require permission to preserve a file" covers
that: Callers need permission to write to the file, or must own it if
its size can't change anyway.

Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 mm/shmem_luo.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index 2ea161fb00fc..ab7e5f51dc7d 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -777,9 +777,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 static bool shmem_luo_can_preserve(struct liveupdate_file_handler *handler,
 				   struct file *file)
 {
-	struct inode *inode = file_inode(file);
-
-	return shmem_file(file) && !inode->i_nlink;
+	return shmem_file(file);
 }
 
 static unsigned long shmem_luo_get_id(struct file *file)
-- 
2.56.1.809.ga0b61035b5-goog

