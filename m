Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503023;
	b=pP+NWXl8GRTQYOWrjV+zAnk4hJyEkqgV9hOIoX0+PAVJ5OtjjOPq+AJ3Ehxuo4t7F7/R
	 /D3nkcpHEtrc7m+m6AW4ciie5rBqYYct2lCZmtpDi5UZ7vvc/H+8J3+otVEZywRDHXnvp
	 X5ahN7nOzJoJIH5QdDacmQFxyFLy4oggr5ZAGtRt+qU7L+AKMH7ZhNWmioiBKG/Z33ByG
	 O89nulELRXz5y7uB+63A5rc8JNvzgn1U6iCGnxjvZKomivUOXtbc4oHOSfoLh+DXijgSa
	 fKt8fl18XwF58TgO6jWqcydp1WLIaba7CAUshztKgSUNQg0bZx9lKp3sARyHfhOs+jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503023;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HQqi6urF++rjVA/a2zH9WSbGfoWrsXjL249Lpetx5Y8=;
	b=xXXPw0zL6gWPmaCXW86SuVQQU7r3CE85SYRfBLvpnUnfGvQx5ZKqwEsEsP37BHJPWsgN
	 9xXo8+7D3oioIQ9CgAzQwk0/oTdmkvyoZvHmPv+sUWJstKLbpW9BFjgJK1RMGaVWnZ/uM
	 cXvP9hZgi+REy60sHjK8AjDuIvqrCfR65RZxZA+1Za06rVrM7iB/iAveBb3pOpOEFy/fz
	 JKW9gUZHzYIhTXfUmJl4boucTCPv2POl8hjLIHjQ28kQ3K6c/eDjSavTpxS3tYmf2p0Ld
	 LyXaEWl3QTLGtuQLTdzIf69LSbGs4gNXomHwDlH38J2aTaoB9kkLIJdC8jSQBGWuEFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=XmgYzYx0;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9449606A334
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9449606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=XmgYzYx0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=HQqi6urF++rjVA/a2zH9WSbGfoWrsXjL249Lpetx5Y8=; t=1795503022; x=1796712622; 
	b=XmgYzYx0A3AAAIAgzpg1+Yg9By/acs+ZlZBXtrhHIxU8JsbNTjr35ZSP8Aj+1taXmi4j+w+RNZB
	wE9jDhkhJkNRjHdj2Er1xErkbjCnT1EjwwTFs0NM8b1IprkzXGonoSEJqy6rgJtNhANMakfuLtZNR
	qTcmquULGdQw116bMR8Lm0Ka4KHLMVHCA0WaJA3AH8KqmB7tJeePdx8WoErUAiZ9l5OZAPRLLnDNb
	4pA41pVx7ZgBpH+b9eeU3d2Lxdmps5StOLV9B+YPPGAqBot4s/c+RPuw/EYKijUwguWAMvd6qiyDv
	p/QzFWguiDe72JEn4XSaCErsOuweWpkmMQ8w==;
From: Andreas Kemnade <andreas@kemnade.info>
To: apw@canonical.com,
	joe@perches.com,
	linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] checkpatch: Fix missing error reporting using --mailback
Date: Tue, 24 Nov 2026 07:50:10 +0100
Message-ID: <20261124065010.1222382-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
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

b4 uses --mailback, E.g. missing Sob tags get unnoticed in b4 prep --check.
See https://lore.kernel.org/all/20261123222615.7ef78105@kemnade.info/
Do check for that flag later, after the checks for Sob, to have it
reported and avoid churn.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 scripts/checkpatch.pl | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b8b64f7201915..5ea03013a6c4d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7867,12 +7867,6 @@ sub process {
 		exit(0);
 	}
 
-	# In mailback mode only produce a report in the negative, for
-	# things that appear to be patches.
-	if ($mailback && ($clean == 1 || !$is_patch)) {
-		exit(0);
-	}
-
 	# This is not a patch, and we are in 'no-patch' mode so
 	# just keep quiet.
 	if (!$chk_patch && !$is_patch) {
@@ -7923,6 +7917,12 @@ sub process {
 		}
 	}
 
+	# In mailback mode only produce a report in the negative, for
+	# things that appear to be patches.
+	if ($mailback && ($clean == 1 || !$is_patch)) {
+		exit(0);
+	}
+
 	print report_dump();
 	if ($summary && !($clean == 1 && $quiet == 1)) {
 		print "$filename " if ($summary_file);
-- 
2.47.3

