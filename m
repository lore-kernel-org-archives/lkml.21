Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684672;
	b=P1iEPbZ4/by8fiGi7YXS9Ms7YsyVo9Lv4/M0ML6pGdwFTIVlv5P+z2EL1h0nwgkh5STw
	 jcC9muR3OGjXirubkqmvLUVcSfEqNPOooJQlw8wZhwJ/nysS3pvH6nbAuKDDM/GRKxcXE
	 PZjZGBlhuTHf3kJlsGNh8J/onxkxH0vfPnkmOUKZu1DWGQwSSKmq5okSkqUQNH3MnM/cv
	 YjMjAIsRAhlvvRPk0KUJ8ZgoFvrlVW7km1yC+gM9x3RobLBQnPZvrEI2YOsZH3AHFz+z8
	 ZHO0qLv2osajElUrYWG5P6c0IBwm11BvfJnT70gXX69Xzmf8Fz2IwitVkjgUZjRiOlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d1IwY0SZ93EHNkqt/Svz5shK9e8xm3IUrcVs2KOn+U4=;
	b=q4uukUjdJvUQ17gxWYfvtEqTGl8mX/cRWwo3jm9NeIfcrk26govc0OY8KxmgRHUm7Rb9
	 ujtMEmW01zl7b6zR483ItQ//12Jw99ypuOk2IWMYPbHoo7/D/vTVpY9v62lVUnfkxuA7X
	 LrAjWzxpw/LrId7h6PYbBvuq7rjNJOPO6gIKmzsRIiiVdu9qI1tK+HWT9hNzCdmCX1CbI
	 itW5xNu6iVbWB2FJ9PcTf3b/wne4uX/h+ED1HTMn1/Mj9DSx3MR+r4TJ3+j5jwUdp6csw
	 NywNoLeNYuEMZT/zoHFFJptVQ7gJCqmup6MIFMdR5Oylot0qimpRcL9/4eFSD8SXzCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UKdPkNX1;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EDB606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EDB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UKdPkNX1
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a3c08d6928so10078321c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684671; x=1796289471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1IwY0SZ93EHNkqt/Svz5shK9e8xm3IUrcVs2KOn+U4=;
        b=UKdPkNX1ksh4wLR19uqs7yJzY0seBapvvpUzVeiK7gjO85SXZLkRlJnYN7yFl0t7qw
         WXUBDT6+entzA1nyOEsU5xoLnqB2ZYFsPUGYC9cTzJWpC+/HDV3o3s8yU3QMh0IH3ajt
         mBCUSFpdrFPdCxo3BPyfl3/F596w10zpEUTAnOuKSPjyLEamF+J/VuAJ3F55any5YnLd
         48x26MOZ4ku33OsQB+b8cWbajtTqvinim4ojQTHcMunlOekR23zpQmKqzORG1QdTAmPW
         BI2N+GNTUAKopZ9BnBsRsLVHS6Nnqa0xjjqq3nG3/I3queyRn3wmaS4WYRQam+M9D4Dg
         NiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684671; x=1796289471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1IwY0SZ93EHNkqt/Svz5shK9e8xm3IUrcVs2KOn+U4=;
        b=ECdeNdh7AinL5ez0jdRk59UwGcGwHZlSEWla27YGh2ktafPOSUM66mwuz8CHQVSZu8
         D/qBSV/aQaIXObA+KeLzgPqhSQj5/F62FyRu25TaPS0l4FATTBfGhZkt6DGmg4C8R55C
         oRr8ZrYfrcqnlDOAjhwfxKq6z1MRmrVaGEALDg9BDtOspadqPZO7bSCjL+A9ldPOeuQr
         r0hJjbWMKbKA1BW+TFKZ2EjndcL7XTRm7NaX8dQbaohmMaiEjP4U0U/IVTavA0Qr1UWT
         GuvdW8puSIfVladYwWpreLyqQWw3bGPYFis8LuHXOqAjE+mynEEeJTsTDQ3TBEDvZzVl
         oSAw==
X-Forwarded-Encrypted: i=1; AL+hErHOvCuRII8l4riic8BlCum0VU1dhlWFSp3n5d1OvgGekse4w3oUfvNm/EFYprBUoOh9lbTFSnQ964agbuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nZNV91FIEy9yCzLS/x1VUXXXnzvV5igu/aYwaiIPrsFMh1BRR
	S7WDZ+aTEX9BzJYpmsbpb+3mhtdSZV30T5OkDS2b3F5uBCqYUZrLc375
X-Gm-Gg: AZFdTZfl7FsYeb1giT5F2Q53EAq9i7VpRc7tAp4ZiofryUIftYHRW2NrqdCRHU91UxG
	vYPVG2UkC0w0Oa8k3qtQ1njTnOheXbQLJsqz4p0UoV8m3icFvMsNnRjs1+p2C3unxqp03JzzSNI
	lhFi4nbMUEUhJ9bsvDuwdqg+D68Y/uVSpwCmcDDl5iEmE+bW8tHTHMrbH26q/LonNqSrMcikILQ
	AfwWvRaLKNhLOWDvvAZRuNod5ItaSaec/uixWATSUxn3X860l2Htlhwt5uEIhQTh/SitzuvRo7K
	3BBcMEk5d3x6iLQ6EY/vbBp+U9IHnV42zsUCBmPxGfQ94XTAbJ5ViSzlrjipS4XdLOVkpNZcKwR
	sUDIjD4547OMU2jDgFGal1SzefhZTxfolEVXrB1cUexb4pYFdfU1b2eahu4szONEX2llTvbb3HQ
	TPyAsE7PHMCtAVnTEjkRFjv7clXI13lZO0x64K0DTN/2YleN4VcWOfm7y2yPsKQHB9WHCGnXfc6
	SLDE8KPoYJ6Uy32qJy/ieXyiNbO8B32FD76jzd5ijYKk4zG6UYTvqeJ0P73Vt4XS4RrmCg3RXb1
	4YPiN1RK82CwFpBdT7T5Y40yu0OlnRBqoV5iEBt++YrRb+gYcPV7Ww78bTo0DY0=
X-Received: by 2002:a05:693c:8803:20b0:386:9b9c:ef1b with SMTP id 5a478bee46e88-3869b9cf99amr15512715eec.3.1795684671328;
        Thu, 26 Nov 2026 01:17:51 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm48060697eec.1.2026.11.26.01.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:17:50 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org
Cc: John Allen <john.allen@amd.com>,
	Aichun Shi <shiaichun@open-hieco.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RAS/AMD/ATL: Check the legacy MMIO hole after the address map is read
Date: Thu, 26 Nov 2026 14:47:44 +0530
Message-ID: <20261126091744.2096611-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
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

norm_to_sys_addr() refuses to translate an address when the legacy MMIO
hole is enabled but the DRAM hole base is unknown.  That check cannot
fire.  It runs on a freshly zeroed addr_ctx, and legacy_hole_en() reads
ctx->map.base, or ctx->map.ctl on DF4 and later.  Both are only filled in
by get_address_map(), which runs two calls further down, so FIELD_GET()
always sees a zeroed register and reports the hole as disabled.

The situation the check was added for is still reachable.
get_df_system_info() only warns when get_dram_hole_base() fails and
leaves df_cfg.dram_hole_base at zero, so the library loads either way.
On a system whose hole is enabled, add_legacy_hole() then compares
against a base of zero, takes the branch for every address, and adds
BIT_ULL(32).  The system physical address handed back is 4 GiB too high,
and the caller retires the wrong page.

This has not been observed on hardware; it needs the DRAM hole base read
to fail on a system that has the hole enabled.

Move the check below get_address_map(), where ctx.map holds the values
read from the Data Fabric.

Fixes: 1233aa3fb342 ("RAS/AMD/ATL: Read DRAM hole base early")
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
Compile-tested only.  ATL needs an AMD Zen system with a Data Fabric, and
norm_to_sys_addr() is only entered from a DRAM ECC error, so I cannot run it
here.  Built at W=1 with CONFIG_AMD_ATL=m, and confirmed core.o is not built
with it =n.  I also replayed the guard outside the kernel, with the same field
masks, across DF2 through DF4p5: it lets every address through today and the
result is 4 GiB too high in each case.

Noticed while reading the Hygon Family 0x18 series, which clones this function
as hygon_norm_to_sys_addr() and places the same check after its own
get_address_map() call [1].  That is the ordering this patch moves to.

Based on origin/master; drivers/ras/amd/atl/core.c is identical in
ras.git edac-for-next, so it applies there too.

[1] https://lore.kernel.org/all/20260528035246.526012-6-shiaichun@open-hieco.net/

 drivers/ras/amd/atl/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index d77dacdd4f56..06744d3aaf0c 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -125,15 +125,15 @@ unsigned long norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id, unsig
 	ctx.inputs.die_id = die_id;
 	ctx.inputs.coh_st_inst_id = coh_st_inst_id;
 
-	if (legacy_hole_en(&ctx) && !df_cfg.dram_hole_base)
-		return -EINVAL;
-
 	if (determine_node_id(&ctx, socket_id, die_id))
 		return -EINVAL;
 
 	if (get_address_map(&ctx))
 		return -EINVAL;
 
+	if (legacy_hole_en(&ctx) && !df_cfg.dram_hole_base)
+		return -EINVAL;
+
 	if (denormalize_address(&ctx))
 		return -EINVAL;
 
-- 
2.54.0


