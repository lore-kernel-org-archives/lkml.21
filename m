Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554274;
	b=I/YU99riJUL8GTZ2PIm11nGFFnozS8eLI1r1CW3sA+N+wbdsY/smmMax8XdnAUBZNWyc
	 TmsVsthruxz8Ajs4TfPgQv8xOPYJjCfAv4+BKOoqGmYH8caAPhEdsiNSffg7AahZrQrnQ
	 vyulZjBAWwIAWvKhSU/0sV3fzAw7DponSJnfpgaYEvfE+YaTlTmowaAwEJjmncHbQlWvU
	 X2lCuyyzyXH++bk/2V0RYAMdLAzK30HX/vrdtmUmG7P00nXR2+sN2uYDQ38UPpIe0Cj17
	 stXROppZRCZIL3cNjc6ZZ1T5qoMphPGQuVFlTrm0BBWnjKWyl5L0hEWH2mwLW1tgv5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5yCOWfdW+sH0T9BYwqdnPRj1Lb92cHfiSwhCHRCjMaA=;
	b=H8NPKrbpPwiT9nUVTwmDTEjPpoz0L/pbQ+GJoVrGvzBUVbQhFKG7n661fREiITAqPngx
	 Vp9sxYPNipZM8sNn37hdbv5j9llIbDqYO9m8hZuEYNf+fzaH4HvhYEBiZBxba5xHEZ9My
	 gpqpfCEk1uAliswtMu/7cqMF25ee3/j/6z/XPd2RZ1xkgsUZIOOvsqU+kLuDnE8NkCVcv
	 JxuR/f0mk3xTvqVjys7PsQ7dHhAGy+cE+uTZH5qFVqrsDLpwHkorktZEmv+iz1naEUL7I
	 8mKIFQF6IoMcyphr8MjSmZDgEa3jrrKhqJ+56tpJN3+nIc+KHIF8kbidWstFfGmzM1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=kR4zlwH+;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=TproxxW9;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE25D606A338
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE25D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=kR4zlwH+;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=TproxxW9
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOKaNWD3267280
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:04:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=5yCO
	WfdW+sH0T9BYwqdnPRj1Lb92cHfiSwhCHRCjMaA=; b=kR4zlwH+KS2IQ7SR+/Gr
	Z0AKidm2HBNBikjS/6jxfVyXGmmH4yW2IR4EF0eUKUDfdzUQ4LPW9tGd1aAhMDr3
	NhOIMd8tdNTPIBThvIUJpR4zBNbxzCMuablpsK5v8Vf1fY6YWJoMu/uIbWTxGJ4e
	vIVYKhgGGzyNIH2mFH1p9yNbduw11ETNhszBmewdb2BOdGoV3r2SDpO9fEIP+t0J
	Efn+W+ETNI6OVMX2Vxub+ayViubrgKLCFfr1GIiMd1v4CPqwIp/FgabTIUXPmZFx
	cEDDtxw6YPpS4S5lmx3HJeKJHWLOSNP1ga4v2HUXq3Wx3XcbtE2Un9ZPv2J52FlI
	Yg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j5eukt1bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:04:33 -0500 (EST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9213237a52eso88919516d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795554272; x=1796159072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yCOWfdW+sH0T9BYwqdnPRj1Lb92cHfiSwhCHRCjMaA=;
        b=TproxxW9I7VH5g9sNfl01CMwdEOy5m9Rg2vI9Vj+F0NFu9XwKf1Ew6zjkCVIvZSrdp
         oRLTBFXB5BKC3SwupquWicYzy9bHM8hTbynW2C8PqEpKaAtrs0Ai4addMN+FO//NUe8R
         isamR1CHXm3njIu144OWy5yLJHtnOofCJ3beq5kk2Fh8/9pWUsj7EBF5QHClVcNuOaQH
         Ca1cpGwSeoM6/XcVPEcqcNlz37hZ4tzOcu7/qcdU85D84jrRrgUDIVaHTpwKn1jbCop5
         I0GMywFazk1UmYXcLYwgoY2iUgce5ug9g3RXEn9IRKhEZBmdIx7k92VxH4uZ+iqAIfPS
         q2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554272; x=1796159072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yCOWfdW+sH0T9BYwqdnPRj1Lb92cHfiSwhCHRCjMaA=;
        b=YtZCOrzOheg9rq5vQsEcU236uAHbp5el/SyHPu27CWDObcSK+MLMOJX1mxouemUtta
         Fd2dG0AkSlyFJ95A+0wS0130UE+ap/tXVBr1lN9ZxbfcpWEPPYK7A+zDp+VkcIyhFsCe
         lMbf/bRxS/QXDTg9bHwkWLIreNXAlCstGGTgLx3Wek1viXshig5/UHobOJxgOKI/kV7Q
         szjLpf8k8J3mtIFKeKmChV1DUYNs8+PpUqnUecSLQBXT9/jt5CN/M3S0LFCp8nzitsTg
         LNogvr3PNqXGVa+vcL1SVf8XToQNMznAA7CjEmE0rOz19qyMSs9pgaN9NtuTZaPiWjsM
         h5Wg==
X-Forwarded-Encrypted: i=1; AL+hErFX4Hqg9ejs+qWASWfpQG31V0EH+zWfiNHqcuar84O3H3T0ez4VginoTarFsheNfaeD++ZeZJX9zcUU9bU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nrd4odj0UPRltZuTW5YbSURx0tklk3V/k+smceOoItX9R7g/5
	vluC/7ug9UvjycJNzI48C29WPTShcp97QG73IkEu20g3MWV0BB50SFth7ZjG2yQbFCklFXajJX+
	F87sRlp8giEAMwFqMco+8iNbydt54U8Wktlfzk9TwGR5CqpRRytTjeht8xnx5/A==
X-Gm-Gg: AZFdTZfPt+nHRPg4gCm7p4b4OwVOfPFWbGykG+Xl1FVIh0w9ZCwYv33kvB4SYbb2Nmi
	Z+scLKEGi7sk2i+OqZCUPN4ebX2F1yYTOvIEpkoEfqw8Nk3UBZZILE7h3KZjdRS2T0mt4wURU+a
	na3Ms3nLlnWOiLP6unamayAARy5vHDMHN1Gar83yrr/LoSzJEZYUNQ+r3N8QwnO61ajM7bv/4PA
	CiYa/WiQTD0g32qG+BmomlxBxvAYWDolVOGVcEdTD2gvIVare/05djyIjy4lNfPeuDkzV6AxOJV
	AknTrfXPCp6xLZdkv1mBAAdLYStUQOGurm8g+Y5umt0OYLfcHgY8mQTFqajr6DauAsf4Wnf3VWd
	4IYqeTfbwLJYGPM3IBtEYDjJ8LGaHQmQ1vBh+VywksXWiC6hRtoUvScekakQ=
X-Received: by 2002:a05:6214:808d:b0:921:19a:e11e with SMTP id 6a1803df08f44-92134b1cdafmr241718106d6.25.1795554272048;
        Tue, 24 Nov 2026 13:04:32 -0800 (PST)
X-Received: by 2002:a05:6214:808d:b0:921:19a:e11e with SMTP id 6a1803df08f44-92134b1cdafmr241717756d6.25.1795554271604;
        Tue, 24 Nov 2026 13:04:31 -0800 (PST)
Received: from [127.0.1.1] ([129.236.231.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a0a454sm142827326d6.35.2026.11.24.13.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:04:31 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 24 Nov 2026 16:04:11 -0500
Subject: [PATCH v2 3/4] gfs2: plug the log writes of a flush
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-gfs2-log-folio-v2-3-f229e90c8285@columbia.edu>
References: <20261124-gfs2-log-folio-v2-0-f229e90c8285@columbia.edu>
In-Reply-To: <20261124-gfs2-log-folio-v2-0-f229e90c8285@columbia.edu>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795554268; l=1958;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=bqNWp6VHwFxSol3mEB7RPaULyNIreDqDGAAxEyCt9po=;
 b=AvTLNjefB7jlAaNoWFzca2dDj/cCGWsPgcMlGuY1CBjfFvlRFAVWqp/L+5hbgiksGkL+R5Gm/
 BawQBB6i7C9BSqOJipcyGZCSONXNVCwxX1VG7HeCKajOwLZJaKjlv8r
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=HJBWhYtv c=1 sm=1 tr=0 ts=6b05fbe1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=LNQXEAmb7IHcZyFqmLK0PA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=69gLQDoYLLJtuS-kOWQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: CK28GsExTwLyPwEnxAofVZcD5-EXVfNk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfX80DBWzk2t1Y0
 Ak0fk9JCY9J4rt+HFulLb8UKnfINIYjVZMColF+UyrJrwMFtnLo5ppYhvps9e1H0LAqFdb4gL1N
 NOygfcMaZsD42u0INqoQ18PO+49TL5+CcwHh/X0VFYhnU/zEQIv8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfXzgq+XmHGbu3f
 zHBTHUvSiGTt+9ORA9148D+TlWKesQwoAmcE5GxJw0w/7uC1bpKKPEz/iQaYFPPJMORYxgm35qf
 zKnvP4//fpZfOEfL5Udi+fqSxzDBink7FDfnpx39GVFCV72O/SNkPZT5JEDhO09MelV+m8vhTg2
 /EcfTs53ier7byJOGijurIt8Z+DnrdKJVu9wyyl7Z9lgXIhc+OGbF4TVIEOwATGr6AUrX5LJv9g
 1sZeQiYEgOrVpuk8YrY/HQl0ySp4G7i1efF/eStIQm8D4eTonb6hJc0B/TVvp3caRpJGko6W7oX
 LpxS8y6j4Yt8VUhLs17TFBbuLqF54vlNeUZ+lzeSH0wKYcAJZEsEMAfJbpFifUskVznaYT5IySk
 fIYxmrys98Gfc9UqPQzS3NgJtP42C0N4amaGL80rwq0yfnfk6+Jxtv/nQitVIKoDuNj5Dcm+wD9
 F2Ksf3syFJ0RM0lzzHw==
X-Proofpoint-ORIG-GUID: CK28GsExTwLyPwEnxAofVZcD5-EXVfNk
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11976
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 clxscore=1015 adultscore=0 bulkscore=10 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240083

__gfs2_log_flush() submits the log blocks of a transaction as several
bios. lops_before_commit() starts a new bio whenever the next block is
not contiguous with the last one or has a different completion handler,
so each descriptor block is a bio of its own. Most of these bios are
contiguous on disk, but the flush does not plug, so without an I/O
scheduler each of them reaches the device as a separate write.

Plug around lops_before_commit() and the submission of the last bio, so
that the block layer can merge the contiguous bios into fewer requests.
The log header is still written after the plug is finished.

With fio 4K write+fsync and no I/O scheduler, this takes the write
requests for 32k fsyncs from 229.5k back to 196.7k, and the p99.9 fsync
latency on null_blk from 51 us back to 41 us.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/gfs2/log.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 2f9f20b40adc..f7bcbb51ebe3 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1088,6 +1088,7 @@ static void __gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl,
 	bool frozen = test_bit(SDF_FROZEN, &sdp->sd_flags);
 	unsigned int first_log_head;
 	unsigned int reserved_revokes = 0;
+	struct blk_plug plug;
 
 	trace_gfs2_log_flush(sdp, 1, flags);
 
@@ -1148,11 +1149,13 @@ static void __gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl,
 	gfs2_ordered_write(sdp);
 	if (gfs2_withdrawn(sdp))
 		goto out_withdraw;
+
+	/* Plug so that the contiguous log bios merge into fewer requests. */
+	blk_start_plug(&plug);
 	lops_before_commit(sdp, tr);
-	if (gfs2_withdrawn(sdp))
-		goto out_withdraw;
-	if (sdp->sd_jdesc)
+	if (!gfs2_withdrawn(sdp) && sdp->sd_jdesc)
 		gfs2_log_submit_write(&sdp->sd_jdesc->jd_log_bio);
+	blk_finish_plug(&plug);
 	if (gfs2_withdrawn(sdp))
 		goto out_withdraw;
 

-- 
2.39.5

