Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649505;
	b=OYtqBMcyg3vbimYNICCxg9otaVjT9sZklTHpOb7aFn3p8SbueJaTXWrxzK4O8BU+44pE
	 1SMOFl95MNmv/si8bRDu6Zh26yCZ8dfEg78r6pwv5MKELtj90fF0IVcYfJsgFRS+czlSV
	 hWSq96W0JirfCDoDR+yCgyEGRitfFMaKnJ8+x5FPJYxhMJk+Jp0QPJFTY1bylkhGg/LzT
	 Xpoj2aJHfDObLrmZMGUTAk3Da0vt4W27ZG2nJMWROoHciCJAM0Bb6yNbjyijn0gorStbS
	 8vIubEO+wqRsptJixOu1N21LVFQNhe/OvfirYpuP+Noh8UuyPN/r/5/AqR87AslPv7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LYw5GBAdPj90q6NncpK72EIMG1Zgi7jH/SYXlLevmww=;
	b=ABoT07LKG2FuaLAqjX+0Wm0R3yPbXyJJxeWnMM359RRXRkkqKVghQgprXueYQwlJMbOg
	 i03WlJ/SVTR5MV7Bvl3CPVnZ1KpK+r1f3Fu5r1eZyiCstZhmfNcS2xRtAIQ0iSEIacbkI
	 5Cwwdl7HFtrZNMT0ZQTNPMvlMvWGnAv7kctgPEsHKcUjwJUTg9q5hNmklNRDHF2P1LpR/
	 bQjusw+zRs4a2zEJcHpsJRNlPrFlGi2xQWjUrCQOPC/INS8bzLhI5uPTDPvGIznOPaHvW
	 /tnTYq5qj46cC75dlt6Hyyg2gixf1XXudSSBxuMxB6wWZ7/XgKILPPAaV/ENHLObMnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IspnHSro;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E18606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E18606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IspnHSro
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso63512775e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649504; x=1796254304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LYw5GBAdPj90q6NncpK72EIMG1Zgi7jH/SYXlLevmww=;
        b=IspnHSroOfZdrf8oMXJQi+UqbqhITZQIa4296wB5r+k/WGVn0u9xhHA7z5rkSosbac
         NpluHrJuqpmEM8xUeJUfYzQwC2UBULp8VKywufzKF1WEAkbDHZP7lWoqlPOkPt/YcCT5
         lqxLiqVgazKrFtPiJnejlGLPtm1iJRjdPyUBne6+AjpsV/AkJvhcMveZL4gLsqea2qKN
         PM55Md3oPkS4+Xc8eNENqdZhQjlFkckr9qWKDP6aC4PeosDOyPQ8X+b18i9FpPlfRPNW
         mMNjN6tc0RLnUmcdyYjITz5nq4erDqcAbODtvjKf3ZlwTihgIi6LRVhbQeos5XUtuhw8
         qkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649504; x=1796254304;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYw5GBAdPj90q6NncpK72EIMG1Zgi7jH/SYXlLevmww=;
        b=UrMnrQfso1TFNetv+xJsPGDUb7XxvjTYb7YE6kKPxi3FaEdUkgNPBaLZB0k3I6xYsj
         UOj7TDS5Pvqu84QIAfarNsuDOCIZKm0Yi1HGEVvqnqOChlSvqBU/39iGF8bNg5BtEdwv
         WI6VixVppFQlyMPNs5dQ+T+yxx/kYL36HKyTZk+ejwwFxROv/CgWla7w2kdaUC8LUQ8S
         T5nu7V6FoNa9Z8bgSUg9ghVUq6iqtSMLEp48bWJYfjZ21rw7omqMYI6Jl9b56B7G+v7A
         bWXOJm/g9O3YW+vI91tnynchM5/vTZLZaOYJQ+dlzKoAJ+/9LpBKN+4mwI6QmeShgVAs
         jVGQ==
X-Forwarded-Encrypted: i=1; AL+hErHEugLyD+f1hVXw25/Ldv6kWl2VkppuOggnpWqhbYc+HRRy1vshilQ08kVnGBtYQPCH7JU5XI6+vnCfZCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hkYqhf8bfFGUbGcPjr9JP1MpQ4NjVRAyXU7v6lgxKvtllxNhG
	OVoS3J+8y0Y/D5at5K7j1oTQH4G4YvgudbC+DqvaQuErbEA8JLu1WVOJ
X-Gm-Gg: AZFdTZd8x4K2rZydoxXuse+0ZXKOokPIozsup+r1uTRg2miEVWMmOQTMAqZlZF3/nvO
	mRdBgNbe5I18o/a562CajO+i620EiqKyUO6noFsSYzQLo5stzZ2XAsHBN4lLYbQ+FS94XHOx475
	8imDEvw92lUfJ2YX8pEEGsKZQSK/nG84D5CCLTar9QYi2kwjapO2IhRqhpSivkt0fA+s69Cvaiz
	YoiBjUfbFPYsem0Lt6gspCx4qv7Ha27nhN8Y2faQrEbIQMc0vmq+BnTLqvHq9VWr6wur5kirNFd
	BDrXvOuMcrqkm9/COMr3JcXzqme64PD9olI/J4e+4nK4r/9ffcLI8vT1UYlHtwhM+LBXhO+CSQA
	p+GyQXVYbaIXgtUGXkdjDidbxeEhx7uTKhw2z2TRuw7FKAhcZMFpqRmX/qB6GOutQx4I54is/T2
	CXrWk33ez430WtPuhxUNgeKl5eslVZhdUrhhJ68hGLhZyWot4p+Nmblrp3/UCPPKZtA9hM24jvl
	L4utFo1qiIBzaQLiwnKDZ0w8WNICHMK+H4lssz/nzjqOc5ofNoi4horKckc90yZ8ADrRFRDWNrF
	n2j24qPxVbmsEMBegz1SWiLBRTCJgsFt5WBuPSWgcxO5Gdh0e4hjq9mCL4UanU37r+SMJa7XcWh
	tBl3imlXrNw==
X-Received: by 2002:a05:600c:6749:b0:4bb:71c1:3ca6 with SMTP id 5b1f17b1804b1-4bb88819d15mr373167565e9.21.1795649503790;
        Wed, 25 Nov 2026 15:31:43 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm611586845e9.12.2026.11.25.15.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:43 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Subject: [PATCH RFC 13/19] serial: esp32: Add early console support for ESP32-P4
Date: Wed, 25 Nov 2026 23:30:14 +0000
Message-ID: <20261125233020.1380594-14-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Register an early console for the ESP32-P4 UART using the UART
configuration left by firmware.

Early console writes can run before timer initialization, and
normal console writes can run with local interrupts disabled. Use
a shared polling routine that bounds the wait for TX FIFO space by
a fixed number of reads.

Allow 10,000 reads per character for the ESP32-P4 early console and
1,000,000 for the other callers. Drop the character if the FIFO
remains full for the entire polling budget.

Verified early boot output and a working UART shell on the Waveshare
ESP32-P4-Module-DEV-KIT with the driver built into an RV32 NOMMU kernel.
With a simulated FIFO, both limits dropped the character when the
FIFO stayed full and wrote it when space became available on the
last read.

AI assisted with integrating the early console and checking
its registration in the linked kernel.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/tty/serial/esp32_uart.c | 50 ++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/esp32_uart.c b/drivers/tty/serial/esp32_uart.c
index 002d6fdbd875..451caeb406fe 100644
--- a/drivers/tty/serial/esp32_uart.c
+++ b/drivers/tty/serial/esp32_uart.c
@@ -25,6 +25,7 @@
 
 #define ESP32_UART_TX_FIFO_SIZE	127
 #define ESP32_UART_RX_FIFO_SIZE	127
+#define ESP32_UART_TX_POLLS		1000000
 
 #define UART_FIFO_REG			0x00
 #define UART_INT_RAW_REG		0x04
@@ -107,6 +108,7 @@
 #define ESP32P4_UART_SW_DTR			BIT(20)
 #define ESP32P4_UART_RTS_INV			BIT(18)
 #define ESP32P4_UART_DTR_INV			BIT(19)
+#define ESP32P4_EARLYCON_TX_POLLS	10000
 
 struct esp32_port {
 	struct uart_port port;
@@ -334,18 +336,18 @@ static void esp32_uart_put_char(struct uart_port *port, u8 c)
 	esp32_uart_write(port, UART_FIFO_REG, c);
 }
 
-static void esp32_uart_put_char_sync(struct uart_port *port, u8 c)
+static void esp32_uart_put_char_sync(struct uart_port *port, u8 c,
+				     unsigned int polls)
 {
-	unsigned long timeout = jiffies + HZ;
-
-	while (esp32_uart_tx_fifo_cnt(port) >= ESP32_UART_TX_FIFO_SIZE) {
-		if (time_after(jiffies, timeout)) {
-			dev_warn(port->dev, "timeout waiting for TX FIFO\n");
+	/* Console writes can run before timer init or with interrupts disabled. */
+	while (polls--) {
+		if (esp32_uart_tx_fifo_cnt(port) < ESP32_UART_TX_FIFO_SIZE) {
+			esp32_uart_put_char(port, c);
 			return;
 		}
+
 		cpu_relax();
 	}
-	esp32_uart_put_char(port, c);
 }
 
 static void esp32_uart_transmit_buffer(struct uart_port *port)
@@ -601,7 +603,7 @@ static int esp32_uart_poll_init(struct uart_port *port)
 
 static void esp32_uart_poll_put_char(struct uart_port *port, unsigned char c)
 {
-	esp32_uart_put_char_sync(port, c);
+	esp32_uart_put_char_sync(port, c, ESP32_UART_TX_POLLS);
 }
 
 static int esp32_uart_poll_get_char(struct uart_port *port)
@@ -635,7 +637,7 @@ static const struct uart_ops esp32_uart_pops = {
 
 static void esp32_uart_console_putchar(struct uart_port *port, u8 c)
 {
-	esp32_uart_put_char_sync(port, c);
+	esp32_uart_put_char_sync(port, c, ESP32_UART_TX_POLLS);
 }
 
 static void esp32_uart_string_write(struct uart_port *port, const char *s,
@@ -718,7 +720,7 @@ static struct console esp32_uart_console = {
 
 static void esp32_uart_earlycon_putchar(struct uart_port *port, u8 c)
 {
-	esp32_uart_put_char_sync(port, c);
+	esp32_uart_put_char_sync(port, c, ESP32_UART_TX_POLLS);
 }
 
 static void esp32_uart_earlycon_write(struct console *con, const char *s,
@@ -784,6 +786,34 @@ static int __init esp32s3_uart_early_console_setup(struct earlycon_device *devic
 OF_EARLYCON_DECLARE(esp32s3uart, "esp,esp32s3-uart",
 		    esp32s3_uart_early_console_setup);
 
+static void esp32p4_uart_earlycon_putchar(struct uart_port *port, u8 c)
+{
+	esp32_uart_put_char_sync(port, c, ESP32P4_EARLYCON_TX_POLLS);
+}
+
+static void esp32p4_uart_earlycon_write(struct console *con, const char *s,
+					unsigned int n)
+{
+	struct earlycon_device *dev = con->data;
+
+	uart_console_write(&dev->port, s, n, esp32p4_uart_earlycon_putchar);
+}
+
+static int __init esp32p4_uart_early_console_setup(struct earlycon_device *device,
+						   const char *options)
+{
+	if (!device->port.membase)
+		return -ENODEV;
+
+	/* Use the UART configuration left by firmware. */
+	device->port.private_data = (void *)&esp32p4_variant;
+	device->con->write = esp32p4_uart_earlycon_write;
+
+	return 0;
+}
+OF_EARLYCON_DECLARE(esp32p4, "esp,esp32p4-uart",
+		    esp32p4_uart_early_console_setup);
+
 static struct uart_driver esp32_uart_reg = {
 	.owner		= THIS_MODULE,
 	.driver_name	= DRIVER_NAME,
-- 
2.56.1

