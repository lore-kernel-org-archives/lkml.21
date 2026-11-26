Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660557;
	b=GFXjdQ2ho54UoUSRrUunPqK2GW1jJGubaM+AS//Rr8Zy3OY+ZeWNKYnc/oxUhZQ4MT7s
	 sB6dAzIc/8HKTcRwFC2ZearitVOsTnTUjffhIWi7ugGLTIBJ0JrU633b0DZzANG5vXl4u
	 wgDeIsWv3/e7+kPSwTG4XgVpHy/XqiSxBypbLHfdDl47QyQepPF/0BmbFlufLvY3vbzQI
	 +iWY2i+Fajuz1EgtKttxmCPignmmPR55SqS5BzvmGDFN1+cdNOPvywdgB1DGSx0rSOF5O
	 NuGpHozcQ3zeocmYuuEsdcwnS8RCgprutF4xKxoG3AJt1FOI9Hvc9KdWhH4gyXIYFLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660557;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oAUPMN5BwpiBiOVIjy6/1EXKeR6EBy8T6wvaSzK4OqM=;
	b=we9Gm/XBE5LT9RCxKnvEQm3HaLhhwJNn6dEHnGBDIoDT0EpMBhBlC8wjhMno1lzDDNHZ
	 J27oM4z9szb10jD6FBvlXFf8nKFv5Oe/ujztVfY+PD+kmyDlpr++bQJobharDStpKPIur
	 PnAWLe7/OMM0/+3A3j5kc+2JVLy4La1u26HJe84wamm0dNlM7O7Cx9EqCe3leDPMOVF21
	 PNzANHEmumNPveqepSMCEhwg7Lc8Jb2UCZd7HphkL+3+x5KUE5GZ/OsrANNlGzyflpZ6e
	 Jq95O9NHCpyvtogrlbyA32oEVdnHeBWQFA5TKvhuKCnvxtNeg21UpgHMevvhTjFb0yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD53606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD53606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386c71feeeaso2873788eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660556; x=1796265356;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAUPMN5BwpiBiOVIjy6/1EXKeR6EBy8T6wvaSzK4OqM=;
        b=JSBt1qRfBatlhEbPwJp59bBscB0ibIjxRLRRlhK/crIA/1OmiA7pbZak+cfMNi83dy
         5R0OCe0evHMTaVwwrHsYdx0Cx6pMGm2ETDMWscRhlxOMrldkAs2CYZhdv29qnsxr9zbw
         7maDyUO/rOwPmlzvTv9pgJVhBF65xrjJlPfK2yp1ClhDawgiykgCV65vxYBl3fZw6nFS
         Xv5fjGyHwqxqisKXhraPjqXlkQDWcAjYcWEismM87L5DZoixkryYDBdhn0JAN00J8Yql
         dxvWyxsAf+C1VGhzhDrvO9iIpOjJhnQSQtQxhrEnhNjPBZJCO0pEK7U9BACFAldHdokk
         LsJg==
X-Forwarded-Encrypted: i=1; AL+hErGQMHRhdHYsecSbJf3mjM8d/hUVmNWP2ljHy451BMPwXc0pwypS4jMk334sMnTROevL48PSz9Ecm011Gng=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zu0/Svsk3FCs7VtZyojpbqrY2F/lGg5FLtS1jbypJjOkyArT8
	e02Vk32Efpj6pmMIVDzoM/bCF4WtCGjk3WzpVN6PAwzHL3MwrvtcvM37lBZjVsMUvNi0
X-Gm-Gg: AZFdTZdn5yEJOy7gaGMfvUzjJlMqtDYEowzzhr6iAUNcEjbDdiUoITgO4cjRdVM3O04
	ekLF2t5l5S6cY/tnzk5z+MDXKU10wAooAG9WePAj4BZAmpizk/HaRhzDUIhfLRE89dOCgHfuoAW
	xNKznIwAgSigmf2wntWGEcIsb+hHIT7gh7oykpuWCoLHreA0Xh8eudq5zRsfQcqshBY+hj1cb/8
	yFK38S6sr3uCGcI2+LUaeFLfbP+ntSQgcq37UDvvREAJnTsnYH8+me/mIuiCwAMcYoYJebgPTh7
	nYo1yx7LDVcB2/8qb7eK8b74UtthTUpH1zoXC5iofKgr7/Bv1m+4wefmifTBPpn6bZLi6cJn2SZ
	UWkd+4YeDp27kbwL+4xjYITMu6DZxY7uV2SE/qJH5RKVKPHYN5oS8cw3QjiWCOkXZuYiOhLVnxf
	N/37yIrQrwX7MvperlQW0j5UJAJn0apX7W4zQf/G5TnBGV/0BEe1LNqYu2fQFkzMDT9PaNagEC6
	t7nzYbTbR5lODTN34o61iLnVZLwrjF6q3mUurYcCKYA6SyiA8kS3l37N2//Y0+/KJk3qzjqKy/l
	4jzcP1ZE6JQEELcL/rBKsIQfh8hehfDUHo6Yqjo4/d6yKu55QQ==
X-Received: by 2002:a05:693c:4143:10b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-386b1067bf5mr12715979eec.20.1795660555606;
        Wed, 25 Nov 2026 18:35:55 -0800 (PST)
Received: from alanui-MacBookPro.local ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm26703230eec.27.2026.11.25.18.35.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Nov 2026 18:35:54 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>
Cc: Dan Williams <djbw@kernel.org>, Ira Weiny <iweiny@kernel.org>,
 Li Ming <ming.li@zohomail.com>, Richard Cheng <icheng@nvidia.com>,
 Ben Cheatham <benjamin.cheatham@amd.com>,
 Michal Schmidt <mschmidt@redhat.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] cxl/edac: Skip event records marked NOT_REPAIRABLE
Date: Thu, 26 Nov 2026 11:35:22 +0900
Message-ID: <20261126023520.39368-3-ai@linux.com>
In-Reply-To: <20261126023520.39368-1-ai@linux.com>
References: <20261126023520.39368-1-ai@linux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Bit 1 of the DPA field in General Media and DRAM event records is the
NOT_REPAIRABLE flag. The device sets it when the memory at that DPA
cannot be repaired.

cxl_find_rec_gen_media() and cxl_find_rec_dram() do not check this flag.
A repair request that matches such a record passes the lookup and is
sent to the device. Since the records are keyed by the raw DPA, this
happens today when user space writes the DPA with bit 1 set.

Skip NOT_REPAIRABLE records in both lookups, so these records cannot
satisfy the cached-event requirement for an online repair. The trace
events already show dpa_flags='NOT_REPAIRABLE' for them, so user space
can tell before it asks for a repair.

The next patch keys the records by the masked DPA. After that, the DPA
from the trace event matches these records too, so the check has to be
in place first.

cxl_find_rec_gen_media() now reads the record, so take the xarray lock
there too, as cxl_find_rec_dram() does. Its only caller just checks the
result, so make it return bool and rename it to
cxl_check_for_rec_gen_media().

Reviewed-by: Li Ming <ming.li@zohomail.com>
Reviewed-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Jongwon Lee <ai@linux.com>
---
 drivers/cxl/core/edac.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/cxl/core/edac.c b/drivers/cxl/core/edac.c
index bd217dccf119..7aaf1242ba2f 100644
--- a/drivers/cxl/core/edac.c
+++ b/drivers/cxl/core/edac.c
@@ -925,24 +925,30 @@ struct cxl_mem_repair_attrbs {
 	enum cxl_mem_repair_type repair_type;
 };
 
-static struct cxl_event_gen_media *
-cxl_find_rec_gen_media(struct cxl_memdev *cxlmd,
-		       struct cxl_mem_repair_attrbs *attrbs)
+static inline bool cxl_rec_not_repairable(const struct cxl_event_media_hdr *hdr)
+{
+	return le64_to_cpu(hdr->phys_addr) & CXL_DPA_NOT_REPAIRABLE;
+}
+
+static bool cxl_check_for_rec_gen_media(struct cxl_memdev *cxlmd,
+					struct cxl_mem_repair_attrbs *attrbs)
 {
 	struct cxl_mem_err_rec *array_rec = cxlmd->err_rec_array;
 	struct cxl_event_gen_media *rec;
+	bool found;
 
 	if (!array_rec)
-		return NULL;
+		return false;
 
-	rec = xa_load(&array_rec->rec_gen_media, attrbs->dpa);
-	if (!rec)
-		return NULL;
+	if (attrbs->repair_type != CXL_PPR)
+		return false;
 
-	if (attrbs->repair_type == CXL_PPR)
-		return rec;
+	xa_lock(&array_rec->rec_gen_media);
+	rec = xa_load(&array_rec->rec_gen_media, attrbs->dpa);
+	found = rec && !cxl_rec_not_repairable(&rec->media_hdr);
+	xa_unlock(&array_rec->rec_gen_media);
 
-	return NULL;
+	return found;
 }
 
 /* Caller holds the xarray lock. The record may be freed once it is dropped. */
@@ -956,7 +962,7 @@ __cxl_find_rec_dram(struct xarray *rec_xarray,
 	lockdep_assert_held(&rec_xarray->xa_lock);
 
 	rec = xa_load(rec_xarray, attrbs->dpa);
-	if (!rec)
+	if (!rec || cxl_rec_not_repairable(&rec->media_hdr))
 		return NULL;
 
 	validity_flags = get_unaligned_le16(rec->media_hdr.validity_flags);
@@ -1845,7 +1851,7 @@ static int cxl_mem_perform_ppr(struct cxl_ppr_context *cxl_ppr_ctx)
 			attrbs.dpa = cxl_ppr_ctx->dpa;
 			attrbs.nibble_mask = cxl_ppr_ctx->nibble_mask;
 			if (!cxl_find_rec_dram(cxlmd, &attrbs, NULL) &&
-			    !cxl_find_rec_gen_media(cxlmd, &attrbs))
+			    !cxl_check_for_rec_gen_media(cxlmd, &attrbs))
 				return -EINVAL;
 		}
 	}
-- 
2.55.0

