Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495373;
	b=074zHkEii/b30zseVOKy8B28meYnINHsSgBxiuf5GppZ7jgW/Ti5UBd2Qnu+bxqYbwgi
	 hh4avR4AORM+bAnvrFQl5Knsu+MrTucY2r2fBztCs9No6umFWoR6IWpVXvyegO20WGgGn
	 kxwQKvhngsKF1ywIoBiZ+wZDhUvn6lL/1kNPA1OS33B4U7qD1Ng86u+OG8dm8rXESTVCy
	 G+eIpHaVFgOYhvzjbJ+LXfhlgtWJ03l5z1ivYsutH1OjsHPvz+ZoMh/i8yGIHw3f/qE6o
	 h2CttDELTbJXrStxJQCEEGatw3rUi6aUNlMqrBYKiNd1bvtiQWIwFENJBNgm4VI47sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YUDl8mbt1Ws917z9q6VKmMNT7CVVkOmO5/VpgLmd0SM=;
	b=SFGn34+IN5c44CSm6RTPXgawd72YjoBEw7eS5mzraH80ZQrdImtayaJMr97pGdkFHUD/
	 OdVSArG7nQallrV3457ZfHfYfZ7jvo1bAQOewdcTNPri6uHFdZ5NYgpJLEHCDXK1ctKPS
	 Afcca63lPSr+ClgFTh+VlCX1vXLV5onUs3+2vAjXbLkbHIywJJcu376hyhqKe47zJ06wO
	 Aj+cherM90v+a3cQfiUHPvDK8nhw/KZulzX1+gaP4GfWg4g1DRTV+q5RrxER64bZJPxHH
	 8M31UDxu3jkCaUp+hxP5BgnK4cGE0py8UCErTKN9pMiLx5c+2SF1lpMiARLfoi3Mz/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKxFuXqC;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B164760A263E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B164760A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKxFuXqC
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a3c08d6928so5781667c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495372; x=1796100172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUDl8mbt1Ws917z9q6VKmMNT7CVVkOmO5/VpgLmd0SM=;
        b=IKxFuXqC4Aywg2AqLOhUG6PQnz5flmGNz8H+RfiXqMcSx6z1D1CAzbrwp1519ooR8c
         1XoqTbxfvNuIobDTkgM63t9tlSh0J/Bo2Gr5Ye9kd56Pzn9QL07Xv6waGxWYYBMM+off
         c0358wc1CmtIDf03wFEgIAEvX/sXGO6sgrcDCQGl2TFdKG5ZcY9N1s+cTPc8Tl2Pn4Gi
         H9ADOIvy6Bzm99OXEkxJw4TioloMomKR3CPh9gkKc09jekuSsCkAwSzSfbnprwQ0u1Bn
         jrz/UtCGIqhGYOJkKSlclG8dhqdw6W1Z+P2jPNs8IZkHBQilVkn/zuop703AEwiNm23W
         GCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495372; x=1796100172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUDl8mbt1Ws917z9q6VKmMNT7CVVkOmO5/VpgLmd0SM=;
        b=kiq5ieWJq1hAmgoeSAiz6UJWGH936QVfOlcF0up0DM2+IZdQtOvgELhh8x/VQfNOVC
         hV0fqXpf7aFx8YWnlBVErTE+u2HyGmSnSF6eUeyk58dfp1RxWQRTU8NDt/OKpa9eBvqV
         M6VRMZZX5gnQzMIQjpurcoONIOmwrPJVhX9YdCiljatJQ+7VcJireiuTgcyLNJeDYY5X
         0uR1eSI4bnmEUOpqg+vsS0Zx9/cxn4PGQaEWNl1Scvh1K3yRX8x6Kw/EtIw/vFsPl2KW
         ZN2b9vieY0Ip5utlOgtcuENa8ntP1eRtaLwtGsvJYgtZbKEmDTlHxg/r6JXUDsIn+sx2
         U8Og==
X-Forwarded-Encrypted: i=1; AL+hErHwvGKbF5VNHd0XlynQV746K/erdNt9glekkoby7ou1y17kuCJI/vS9+Ahg143ZaBon1Hqh/BftPQcYD1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tYLMSfJVHA7Qi8sT46AS8pdUzZNeRzJcvcQ8KSZafqnX4bjsg
	ayNFylC+K2N95Z0S70QhjWY0ZdVG0YfGYOBwl4uczwg1RSqdkKr5t5oV
X-Gm-Gg: AZFdTZfOrgxNf9GUqCrT6/Dw/qny2kijHIm5rZE8SY5KHzCNLri/0HI7OguKAoggP8n
	3SvtQ8Lp6CSmG8Xui10dCF+vBypbDa4LI7cMuvrjrm2lgAP6aYK1S1llIsAj1DiDOuqB/X1fMg/
	a9uPazmnoxax4MCC2IPdzKapOXq99AndbtKj2Ob1L+WiJ0UxW07xCX9liFnHkh9gQu32iO4nnhN
	GyBUM2SEWSSg+ql9KNA06J8xDNDR1GZkl/kvwOMpxh7Rj+XSvLknRTu8RJNGvb4DLu1utjHvPSu
	s/ko7E4agSgv7ssseWctsYgpe2/BjzuoyIjYkJ7dLyRMPrdox44faBkK2Pw3va09+/ecA5VJD99
	yibnh8mbwr9LxL2XjDPgfbQgiHLjvfmosCsqd87L2J8O8I+Q3BhKtOCHnEd1nilcs8Qjke28dLs
	Zfz0hrBv+BnQeHAehjD+AmzfgJYqcw9vyCnerJ0aGkA9mjZ46RXrdfSEP44xVow+AfCxdfeNwCv
	Dt44qRLdEMDFcJ36SrGYTklCSfZTjNfbu+5xrfnk90xBaFZNODDWnios7GG1UDJ8tpuzgq2MHiV
	6kQbWnUJUhj+RHYJgNA+GaXnrc12tRsC3joMe203G9hJTLrz39qvUrcb8IYnqGnlqNfBnSnvJvU
	0Z+k36EivtaEY5G1a8CZpF7PPbJl1d8d3NynZUGTaoOXIpzb7UzD6tq1Nw1AYa+aRyS292R8f
X-Received: by 2002:a05:7022:1583:b0:16e:c820:b20d with SMTP id a92af1059eb24-1b5567b2204mr13970761c88.5.1795495371714;
        Mon, 23 Nov 2026 20:42:51 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm31208084c88.3.2026.11.23.20.42.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:51 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	arnd@arndb.de,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	john.stultz@linaro.org,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v5 7/8] ptp: ocp: correct the DCF output frequency
Date: Mon, 23 Nov 2026 20:42:49 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-7-ahmadexp@gmail.com>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
References: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
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

The output selector table uses 77000 Hz for DCF, whereas the input table
and the DPLL supported frequency list use 77500 Hz. A request for the
advertised DCF77 frequency consequently fails on an output, and reading
that output reports a frequency outside its advertised set.

Use 77500 Hz for the DCF output selector as well.

Source-derived set/readback tests with stubbed MMIO fail at 77500 Hz
with the old entry and pass with the correction under ASan/UBSan.
No physical card was tested.

The issue was reported by the Sashiko review. Codex assisted with this
table correction, its regression test and the changelog.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - Renumbered from v4 patch 4; code and commit message unchanged.
 - Preserve Vadim's Reviewed-by on this unchanged correction.

Testing: actual DPLL set/readback for 77500 Hz passes with stubbed MMIO;
restoring 77000 Hz fails at runtime.

 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index e27abe2c24c7..821ecd1a13c8 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1373,7 +1373,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
 	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
 	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
-	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
+	{ .name = "DCF",	.value = 0x0020,  .frequency = 77500 },
 	{ .name = "GEN1",	.value = 0x0040 },
 	{ .name = "GEN2",	.value = 0x0080 },
 	{ .name = "GEN3",	.value = 0x0100 },
