Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446122;
	b=YKtHRKuf4G3YeCsVBVWNXM3JW+7PBE8U9/keP25pn554hTlT6cLbrmmgG6zWu+G1FSjL
	 3aXX2jKpf8pmmMPDnQXOuprP5WE4ye1Cd1y5OsVZy/0ZdA1pVARCqA7abV58jFIlewkcT
	 KmvNBIiv7yK6zTGEISPHQMy8WAkydunepguMp00w5r3JI6zSwnR1ECOWaYnGynGN0Qf+Y
	 f9rcxd9fRXVCs2mchwVg5TmKEyNXvVO2A5oUjhz83Kd3KQvMe1dDD9n7dN4tC9uwquZB7
	 VSYq0vCPGXNsEFRguouDMx0rSgVRQPl3Pz4N4mTRhiN16qomH0Goz18ZYTlqEpdX8Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pOYA2Qi1LlJis/jVtzIzVcnlnxrkX7HcTKZW7RMWJJU=;
	b=r4eW+OYmATZxUhUbPtF3XytCVNUuuyWq/f7PIlrHjJ+8eM/HOD+fH/+gVArjrf++OLC0
	 91yvxecLZQVFLKmHLH7YAtKzuTLowo35eXzX4YGAX/gq29pmqdDgsnU64qoDnYBUUm8Gq
	 sCSxBSkEgOOdzfewNIEVwQfEdC9rtSBOg1HSGi16gmEYXAGrjI9NqVZoN6lXC08nuiodE
	 IxN18qgwv+Q92U5w4wICJ648ISXBtuVTLHlcJgpktyK+hK4medmBK2L83T5UEI3nGpFLB
	 CkiEJC4YMENdz6GC2hqwhiBZncZjCYZ9xJ+jMN5xwod4mbNbpv86PNDGyH6gQnlpS2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PFGY/RjX";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD5606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12AD5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFGY/RjX
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d21051042so555618766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446120; x=1796050920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOYA2Qi1LlJis/jVtzIzVcnlnxrkX7HcTKZW7RMWJJU=;
        b=PFGY/RjXbySdDDj/pp6OdOvHoO/0OOP8E7WNKI70NcGhBkY4msp0/7Vx5qsuwJfvdL
         I/hrefBfj31N7LpxF1azSYXgIqtw5bsCsHQsASenFuwavkFlY4tWEw/tl1AxFykZji3N
         xMRbo0+XVluQPZ8sXqtWkaUM+VvArmxnAKZXiEAquJBE/+62gRn5exC5U2aqkd1qbRqZ
         rwMP836ZeG8yzYTByyr2vhshRX05z5PnfT0qh1x32mwKThJvqFE8FFULPthw7TlrYXDt
         S+Z8uA0PkopmzFGyMZmXIoQnQEdzKq8DxfG8Rmtp+t8Y8nhYCrmt3tB/vbimaxocWHsd
         OGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446120; x=1796050920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOYA2Qi1LlJis/jVtzIzVcnlnxrkX7HcTKZW7RMWJJU=;
        b=JQuIdy2Hnge1DqWS2GSsGCLcU7KMSp6dJ3Uvs9PJlKzhespF/pRAHNJ2D2l/tgg9V7
         WOqc0gi3trEeFuFWTvA1IjnaiiKuyOYfYEWzd3iSVA81jP9qfzg83CwUj1pBSd/dcv9B
         wPxNR7Xgce+Fp6cDwMCszgtQpp3NxI07gr0K0hSrYlQJxZCN7qQlTxF5obezEdKHqwVZ
         PApeC2f1YXOGZS4Fix7rv7+9gILF8NhO3qKOgqs3WYu4683ELDSL7aYudoBNhThrQt7y
         Mwl3CgHk6jDnJQwVhjpcxiFcWo3pHowciMyDf3cwoWkR5qEoAyqGuTzVX/jqFz8jDGa5
         sJmA==
X-Forwarded-Encrypted: i=1; AL+hErFhjcoImOvITxxIoIdDlex3QtBDHOF6HkFG8MUZdNQNysJSftnLXSWm+Y5vUM+xWYNUo4k+yuehn81b0wE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i4y7zbMCxiy8IEi5TTbGIX0GGJhyaGAPtXVrjQS7Dwi3uFxqZ
	7GR2FrPAcnfb/E2yaeztCiYcgFvLpjq6l82srrM8G+ujYl3wjQe3mC9o
X-Gm-Gg: AZFdTZeE6JyCa54eR2TYBPhzfBCGlcJoiCUs+x97TFZe7Jrlt0TATCjpkv70X7Ny7uL
	o820Jq7tJILo7qlYYOiCLro3rXQ2oA7+UkVSWIGMs7mKpN5SHtxcLUJaMwr9YnIJQGqUHos8l19
	6N6JfEovOrDju/nYXufTR5/d8F3QN+fQp6jtO26Cln9FbMXnwCWz8F6qEXVInuWpAAHHSetDywJ
	ca56hQjN5H1Qbxq2T5wKP+FEUBzXae7EpZKVIh6vhE9N3i18EuH7OKi3XwcizZuK/B8ca98ljKP
	QVVChjsyJzK8K5hbPeXBpkYD1BXCL5rwMC4NQXZlvM8oOT/Xv0Zs8GGTXD9qh5WY4x9zJC2qg7l
	BOf6bEISZk4RaN4FuVCdlo/54G8uTPjD+Se3f0wM2wyq3KPSzdYz85V0v6oVZUlV9IPPT/pi95U
	EdpnaLvEQfmSolFXibydgO+G3GBTZq7sS7RpWroLyrFh8XDw+d4Hz+rBgQ+3lN55O1gUBbu2JFO
	4xaf4Bed9zE89daHmFniB2RuKCWyvQ2wlqth8xNbMHPVN4htpUHb/9cwIq/DPP4Iwk8oG5VZFGT
	38Q/0pNTgw73pkxw0XwrN2EYy2ZU8Bp5U9HX1dQuvGQKqPxO2sXST6uBpEGYK9r2S/HcN+bcMdH
	xhaM0Lunv45S/S2aX5Spo
X-Received: by 2002:a17:906:9c84:b0:c44:16ad:c31d with SMTP id a640c23a62f3a-c513a3a720fmr1021359566b.4.1795446120175;
        Mon, 23 Nov 2026 07:02:00 -0800 (PST)
Received: from localhost.localdomain (86-95-26-230.fixed.kpn.net. [86.95.26.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm418398366b.61.2026.11.23.07.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:01:58 -0800 (PST)
From: Ezra George <georgeezra017@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ezra George <georgeezra017@gmail.com>
Subject: [PATCH] selftests: pidfd: declare pidfd_poll_test TAP plan
Date: Mon, 23 Nov 2026 16:01:27 +0100
Message-ID: <20261123150127.635412-1-georgeezra017@gmail.com>
X-Mailer: git-send-email 2.43.0
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

pidfd_poll_test.c uses the low-level kselftest.h helpers, but does not
call ksft_print_header() or ksft_set_plan(1) before reporting its result.

This produces incomplete TAP output and a plan mismatch:

  # Planned tests != run tests (0 != 1)

Add the TAP header and declare the single expected result.

Tested: tools/testing/selftests/pidfd/pidfd_poll_test 1
Signed-off-by: Ezra George <georgeezra017@gmail.com>
---
 tools/testing/selftests/pidfd/pidfd_poll_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/pidfd/pidfd_poll_test.c b/tools/testing/selftests/pidfd/pidfd_poll_test.c
index 232304f818c7..416a136bb6eb 100644
--- a/tools/testing/selftests/pidfd/pidfd_poll_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_poll_test.c
@@ -31,6 +31,9 @@ int main(int argc, char **argv)
 
 	fds.events = POLLIN;
 
+	ksft_print_header();
+	ksft_set_plan(1);
+
 	if (argc > 2)
 		ksft_exit_fail_msg("Unexpected command line argument\n");
 
-- 
2.43.0

